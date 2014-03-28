require 'open-uri'
require 'net/http'
require 'json'

class OrdersController < ApplicationController
  before_filter :signed_in_user, unless: :format_json?, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_filter :correct_user,  unless: :format_json?, only: [:edit, :delete]
  before_filter :admin_user,    unless: :format_json?, only: [:show, :index, :edit, :destroy]
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.paginate(page: params[:page], conditions: ["has_paid = true"], per_page: 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: custom_json_for_show(@order) }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to root_url, notice: "Your cart is empty"
      return
    end
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = current_user.orders.new(params[:order])
    @order.add_line_items_from_cart(current_cart)
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to("http://cs410.cs.ualberta.ca:42001/paybuddy/payment.cgi?grp=5&amt=#{@order.total_price}&tx=#{@order.id}&ret=#{paid_url}") }
        format.json { render json: @order, status: :created, location: @order }
      else
        @cart = current_cart
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # Get /orders/paid?auth=???&tx=ID
  def paid
    if params[:auth] # successfully paided via PaybuddyAPI
      @order = Order.find(params[:tx])  
      @order.toggle(:has_paid)
      if @order.save
        flash[:success] ='Payment Success. Thank you for your order!'
        redirect_to root_url
      else
        flash[:error] ='Error, Payment was unsuccessful!'
        redirect_to root_url
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def delivered
    @order = Order.find(params[:id])
    
    @order.line_items.each do |item|
      if item.product.quantity < item.quantity
        increase = web_service_call(item.product.code, item.quantity, item.product.id)
        if increase.nil?
          redirect_to @order, notice: "Sorry, No product in stock for #{item.product}."
        end
        item.product.quantity = item.product.quantity + increase
      end
        item.product.quantity = item.product.quantity - item.quantity
        item.product.save
    end

    @order.toggle(:delivered)
    @order.delivery_date = get_delivered_date @order
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.js   { @order }
        format.json { head :no_content }
      else 
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity  }
      end
    end
  end


  def web_service_call(product_code, quantity, id)
    markets = JSON.parse(open("http://cs410-ta.cs.ualberta.ca/registration/markets").read)
    markets["markets"].each do |market|
      products = JSON.parse(open("#{market["url"]}/products").read)
      products["products"].each do |product|
          if product["id"] == product_code
            product_details = JSON.parse(open("#{market["url"]}/products/#{product_code}").read)
            if product_details["quantity"] >= quantity
              ##buy item
              x = Net::HTTP.post_form(URI.parse("#{market["url"]}/products/#{product_code}/order"), {"amount" => "#{quantity}"})
              status = JSON.parse(x.body)
              if !status["order_id"].nil?
                return quantity
              end
            end
          end
        end
    end
    return nil
  end

  def get_delivered_date(order)
    if order.shipping_type == "Standard-Shipping"
      7.day.from_now
    elsif order.shipping_type == "Two-Day Shipping"
      2.day.from_now
    else
      1.day.from_now
    end
  end

  def format_json?
    request.format.json?
  end

  def custom_json_for_show(order)
        { :delivery_date => "#{order.delivery_date}"}
  end
  
end

