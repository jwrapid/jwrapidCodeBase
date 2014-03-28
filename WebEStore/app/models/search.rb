# == Schema Information
#
# Table name: searches
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  category_id :integer
#  min_price   :decimal(, )
#  max_price   :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  code        :string(255)
#

class Search < ActiveRecord::Base
  attr_accessible :category_id, :description, :max_price, :min_price, :name, :code

  def products 
    @products ||= find_products
  end

private 

  def find_products
    products = Product
    products = products.where("name like?", "%#{name}%") if name.present?
    products = products.where("description like?", "%#{description}%") if description.present?
    products = products.where(category_id: category_id) if category_id.present?
    products = products.where("price >= ?", min_price) if min_price.present?
    products = products.where("price <= ?", max_price) if max_price.present?
    products = products.where("code like?", "%#{code}%") if code.present?
    products
 end

end
