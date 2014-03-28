class ProductsController < ApplicationController
  before_filter :signed_in_user, only: [:destroy, :new, :create, :edit, :update]
  before_filter :admin_user,     only: [:destroy, :new, :create, :edit, :update]

  # GET /products
  helper_method :sort_column, :sort_direction
  def index
    respond_to do |format|
      format.html do
        @most_sold_products = LineItem.most_sold_product
        @popular_cart_products =LineItem.most_popular_product_in_cart
        @most_voted_products = Product.paginate(page: params[:page], per_page: 15).limit(3).find_with_reputation(:votes, :all, {:order => "votes"})
        
        if sorted_by_votes?
           @products = Product
        else
           @products = Product.order(sort_column + " " + sort_direction)
        end  

        if !params[:category].nil?
           @products = @products.paginate(page: params[:page], conditions: ["category_id = ?","#{params[:category]}"], per_page: 15)
           if sorted_by_votes?
              @products.find_with_reputation(:votes, :all, {:order => "votes"})
           end
        elsif !params[:search].nil?
           @products = @products.paginate(page: params[:page], conditions:['lower(name) LIKE ? OR lower(description) LIKE ? OR lower(code) LIKE ?', "%#{params[:search].downcase}%", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%"], per_page: 15)
           if sorted_by_votes?
              @products.find_with_reputation(:votes, :all, {:order => "votes"})
           end
        else
           @products = @products.paginate(page: params[:page], per_page: 15)
           if sorted_by_votes?
              @products.find_with_reputation(:votes, :all, {:order => "votes"})
           end
        end
      end
      format.json {render json: { products: custom_json_for_index(Product.where("quantity > 0"))}}
    end
  end

  def sorted_by_votes?
     if !params[:sort].nil?
         then if params[:sort]['votes'].present? 
              @by_votes = true
              else
              @by_votes = false
         end
     else 
          @by_votes = false
     end
  end

  # GET /products/1
  def show
    respond_to do |format|
      format.html do
        @product = Product.find(params[:id])
        @Product
      end
      format.json do
        @product = Product.find_by_code(params[:id])
        render json: custom_json_for_show(@product) 
      end
    end
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:success] = "Product was successfully created."
      redirect_to @product
    else
      render 'new'
    end
  end

  # PUT /products/1
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:success] =  'Product was successfully updated.'
      redirect_to @product
    else
      render 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success] = "Product destroyed."
    redirect_to products_url
  end

def order
    @product = Product.find_by_code(params[:id])
    amount = params[:amount]
    user = User.find(1)
    order = user.orders.new(full_name: "Store Transaction",
                            address: "From the Internet",
                            city: "Interweb",
                            postal_code: "www.com",
                            shipping_type: "Standard-Shipping")
    order.toggle(:has_paid)
    order.delivery_date = Time.now
    order.save
    
    line_item = LineItem.create(product_id: @product.id,
                   quantity: params[:amount],
                   cart_id: nil,
                   order_id: order.id)
    
    respond_to do |format|
      if line_item.save
        format.json { render json: custom_json_for_order(order)  }
      end
    end
  end

 def vote
   value = params[:type] == "up" ? 1 : -1
   @product = Product.find(params[:id])
   if current_user
      @product.add_or_update_evaluation(:votes, value, current_user)
   end
   redirect_to :back, notice: "Thanks for voting the product."
 end

  private

  def custom_json_for_order(order)
    {:order_id => "#{order.id}",
    :delivery_date => "#{order.delivery_date}"}
  end


  def custom_json_for_index(products)
    list = products.map do |product|
        { :id => "#{product.code}"}
      end
    list
  end

  def custom_json_for_show(product)
        { :id => "#{product.code}",
          :category => "#{product.category.name}",
          :name => "#{product.name}",
          :desc => "#{product.description}",
          :img => "#{product.image}",
          :price => "#{product.price}",
          :weight => "#{product.weight}",
          :dim => "#{product.dimension}",
          :quantity => "#{product.quantity}"
        }
  end

  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end