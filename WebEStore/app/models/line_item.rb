# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  cart_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :integer          default(1)
#  order_id   :integer
#

class LineItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :product
	belongs_to :cart

	def total_price
		product.price * quantity
	end

	def self.most_sold_product
    	select("product_id, count(*)")
		.where("order_id is not null")
		.group("product_id")
		.order("count(*) DESC")
		.limit(3)
	end

	def self.most_popular_product_in_cart
		select("product_id, count(*)")
		.where("cart_id is not null")
		.group("product_id")
		.order("count(*) DESC")
		.limit(3)
	end
end
