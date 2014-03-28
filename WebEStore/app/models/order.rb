# == Schema Information
#
# Table name: orders
#
#  id            :integer          not null, primary key
#  full_name     :string(255)
#  address       :text
#  city          :string(255)
#  postal_code   :string(255)
#  shipping_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  delivered     :boolean          default(FALSE)
#  user_id       :integer
#  delivery_date :date
#  has_paid      :boolean          default(FALSE)
#

class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  belongs_to :user
  
  attr_accessible :address, :city, :full_name, :postal_code, :shipping_type, :delivery_date

  SHIPPING_TYPES = [ "Standard-Shipping", "Two-Day Shipping", "Express (within 24 Hours)" ]  
  validates :address, :city, :full_name, :postal_code, :shipping_type, :user_id, presence: true
  validates :shipping_type, inclusion: SHIPPING_TYPES
  
  default_scope order: 'orders.created_at DESC'

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def add_line_items_from_cart(cart)
  	cart.line_items.each do |item|
  		item.cart_id = nil
  		line_items << item
  	end
  end
     
end
