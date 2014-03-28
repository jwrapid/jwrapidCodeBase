class Categories < ApplicationController
  before_filter :signed_in_user, only: [:destroy, :new, :create, :edit, :update]
  before_filter :admin_user,     only: [:destroy, :new, :create, :edit, :update]

  # GET /categories
  def index
    @categories = Category.paginate(page: params[:page], per_page: 15)
  end

  # GET /categories/1
  def show
    @categories = Category.find(params[:id])
  end
end