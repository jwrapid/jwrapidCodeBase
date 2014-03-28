class SearchesController < ApplicationController
helper_method :sort_column, :sort_direction
    def new
       @search = Search.new
    end

    def create
       @search = Search.create!(params[:search])
       redirect_to @search
    end

    def show
      @search = Search.find(params[:id]).products.order(sort_column + " " + sort_direction)
      @most_sold_products = LineItem.most_sold_product
      @most_popular_products = LineItem.most_popular_product_in_cart
      @most_voted_products = Product.paginate(page: params[:page], per_page: 15).limit(3).find_with_reputation(:votes, :all, {:order => "votes desc"})
    end

private
  
  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
