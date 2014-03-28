class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

 # GET /users
  def index
     @users = User.paginate(page: params[:page], per_page: 20)
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    @orders = @user.orders.paginate(page: params[:page], conditions: ["has_paid = true"], per_page: 20)
  end

  # GET /users/new
  def new
  	@user = User.new
  end

  # GET /users/1/edit
  def edit
  end
  
  # POST /users
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user, nil
      flash[:success] = "Welcome to the e-Store!"
      redirect_to @user
    else
      render 'new'
    end
  end

  # PUT /users/1
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user, nil
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DESTROY /users/1
  def destroy
    user = User.find(params[:id])
    unless current_user?(user)
      user.destroy
      flash[:success] = "User destroyed."
    end
    redirect_to users_url
  end

end
