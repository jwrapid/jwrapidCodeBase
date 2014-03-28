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

require 'spec_helper'

describe Product do

 before do
   @product = Product.new(name: "Example Product",
                    			image: "c000001.png",
                    			price: 99.99,
                    			description: "This is a description for example product")
 end

	subject { @product }

	it { should respond_to(:name) }
	it { should respond_to(:code) }
  it { should respond_to(:image) }
	it { should respond_to(:price) }
  it { should respond_to(:description)}
  it { should respond_to(:weight) }
  it { should respond_to(:dimension) }

  it { should be_valid }

	describe "when name is not present" do
    	before { @product.name = " " }
    	it { should_not be_valid }
  end

 	describe "when description is not present" do
    	before { @product.description = " " }
    	it { should_not be_valid }
 	end

  describe "when image is not present" do
    	before { @product.image = " "}
    	it { should_not be_valid }
  end

 describe "when price is not present" do
      before { @product.price = " "}
      it { should_not be_valid }
  end

  describe "when price is negative" do
      before { @product.price = -99.99}
      it { should_not be_valid }
  end

  describe "when price is zero" do
      before { @product.price = 0}
      it { should_not be_valid }
  end

  describe "when price is postive" do
      before { @product.price = 0.01}
      it { should be_valid }
  end

  describe "when image format is invalid" do
    it "should be invalid" do
      images = %w[image.mp4 imageExample.gif.more Random_Image.doc]
      images.each do |invalid_image|
        @product.image = invalid_image
        @product.should_not be_valid
      end      
    end
  end

  describe "when image format is valid" do
    it "should be valid" do
      images = %w[image.png imageExample.gif Random_Image.jpg]
      images.each do |valid_image|
        @product.image = valid_image
        @product.should be_valid
      end      
    end
  end

  describe "when name is already taken" do
      before do
        product_with_same_name = @product.dup
        product_with_same_name.name = @product.name
        product_with_same_name.save
      end

      it { should_not be_valid }
  end

  describe "when name is too short" do
      before { @product.name = "a" * 9 }
      it { should_not be_valid }
  end

end
