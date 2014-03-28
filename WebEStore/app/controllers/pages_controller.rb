class PagesController < ApplicationController
  def home
  	@most_sold_products = LineItem.most_sold_product
  	@popular_cart_products =LineItem.most_popular_product_in_cart
        @popular_voted_products = Product.paginate(page: params[:page], per_page: 15).limit(3).find_with_reputation(:votes, :all, {:order => "votes desc"})
  end

  def contact
  end

  def about
  end

  def help
  end
  
  def admin
    if params[:range]
      @start_date = Date.civil(params[:range][:"start_date(1i)"].to_i,params[:range][:"start_date(2i)"].to_i,params[:range][:"start_date(3i)"].to_i)
      @end_date = Date.civil(params[:range][:"end_date(1i)"].to_i,params[:range][:"end_date(2i)"].to_i,params[:range][:"end_date(3i)"].to_i)

      @sum_of_products_by_user = ActiveRecord::Base.connection.execute("select products.name as product, users.name as user, sum(line_items.quantity) AS total,
                                                    (products.price * sum(line_items.quantity)) as price
                                                     from line_items, orders, products, users
                                                     where line_items.order_id = orders.id
                                                     and users.id = orders.user_id
                                                     and line_items.created_at > to_date('#{@start_date}', 'YYYY-MM-DD')
                                                     and line_items.created_at < to_date('#{@end_date}', 'YYYY-MM-DD')
                                                     and products.id = line_items.product_id
                                                     group by products.name, users.name, products.price
                                                     order by users.name")

      @most_sold_products_by_quantity = ActiveRecord::Base.connection.execute("select products.name as product, sum(line_items.quantity) AS total
                                                  from line_items, products
                                                  where line_items.order_id is not null
                                                  and line_items.created_at > to_date('#{@start_date}', 'YYYY-MM-DD')
                                                  and line_items.created_at < to_date('#{@end_date}', 'YYYY-MM-DD')
                                                  and products.id = line_items.product_id
                                                  group by products.name
                                                  order by total DESC")

      @most_orded_products = ActiveRecord::Base.connection.execute("select products.name as product, count(*) As total 
                                              from line_items, products 
                                              where line_items.order_id is not null
                                              and line_items.created_at > to_date('#{@start_date}', 'YYYY-MM-DD')
                                              and line_items.created_at < to_date('#{@end_date}', 'YYYY-MM-DD')
                                              and products.id = line_items.product_id
                                              group by products.name
                                              order by total DESC")
      @most_looked_at_products = ActiveRecord::Base.connection.execute("select products.name as product, count(*) As total
                                              from line_items, products 
                                              where line_items.cart_id is not null
                                              and line_items.created_at > to_date('#{@start_date}', 'YYYY-MM-DD')
                                              and line_items.created_at < to_date('#{@end_date}', 'YYYY-MM-DD')

                                              and products.id = line_items.product_id
                                              group by products.name
                                              order by total DESC")

    end
    @most_voted_products = Product.find_with_reputation(:votes, :all, {:order => "votes DESC"})
  end

end


