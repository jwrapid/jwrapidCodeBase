# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  code        :string(255)
#  name        :string(255)
#  image       :string(255)
#  price       :decimal(8, 2)
#  description :text
#  weight      :decimal(8, 2)
#  dimension   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  quantity    :integer          default(0)
#

class Product < ActiveRecord::Base
  has_many :line_items
  has_reputation :votes, source: :user, aggregated_by: :sum
  belongs_to :category

  before_destroy :ensure_not_referenced_by_any_line_item
  
  attr_accessible :code, :description, :dimension, :image, :name, :price, :weight, :category_id, :quantity

  validates :name, :description, :image, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :weight, :allow_blank => true, numericality: {greater_than_or_equal_to: 0.01}
  validates :name, uniqueness: true, length: { minimum: 10 }
  validates :image, allow_blank: true, format: {
  	with: %r{\.(gif|jpg|png)$}i,
  	message: 'must be a valid extension for GIF, JPG or PNG image.'
  }

  def voted_for?(product)
      evaluations.where(target_type: product.class, target_id: product.id).present?
  end

private
	# ensure that there are no line items referencing this product
	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Line Items present')
			return false
		end
	end
end
