require 'spec_helper'

describe "Products pages" do

	subject { page }

  describe "index" do
  	let(:product) { FactoryGirl.create(:product) }
 
  	before(:each) { visit products_path }
  	
  	it { should have_selector('title', text: 'Products') }
    it { should have_selector('h1',    text: 'Products') }
	   	
    describe "pagination" do

    	before(:all) { 30.times { FactoryGirl.create(:product) } }
      after(:all)  { Product.delete_all }

      it { should have_selector('div.pagination') }

      it "should list each product" do
        Product.paginate(page: 1, per_page: 15).each do |product|
          page.should have_selector('td', text: product.name)
          page.should have_selector('td', text: product.price.to_s)
        end
      end
    end

		describe "Delete and other links" do
			before(:all) { 30.times { FactoryGirl.create(:product) } }
      after(:all)  { Product.delete_all }

			it { should have_link('Details')}

			it { should_not have_link('New Product')}
			it { should_not have_link('Delete')}
			it { should_not have_link('Edit')}

			describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit products_path
        end

		  	it { should have_link('Details') }
		  	it { should have_link('New Product')}
				it { should have_link('Edit')}
				it { should have_link('Delete', href: product_path(Product.first))}

			  it "should be able to delete product" do
	          expect { click_link('Delete') }.to change(Product, :count).by(-1)
	      end
	    end
	  end
  end

  describe "show page" do
    let(:product) { FactoryGirl.create(:product) }
    before { visit product_path(product) }

    it { should have_selector('title',    text: product.code) }
    it { should have_selector('h1',    text: product.name) }
    it { should have_link('Back', href: products_path) }
    it { should_not have_link('Edit', href: edit_product_path(product)) }
  end

  describe "edit page" do
     let(:admin) { FactoryGirl.create(:admin) }
     let(:product) { FactoryGirl.create(:product) }
    before do 
      sign_in admin
      visit edit_product_path(product)
    end

    describe "page" do
      it { should have_selector('h1',    text: "Update product") }
      it { should have_selector('title', text: "Edit Product") }
      it { should have_button('Save changes')}
      it { should have_link('Show') }
      it { should have_link('Back') }
    end

    describe "with invalid information" do
      before do
        fill_in "Name",         with: ' '
        fill_in "Image",        with: ' '
        fill_in "Price",        with: 0
        fill_in "Description",  with: ' '
        click_button "Save changes"
      end

      it { should have_content('error') }
    end

    describe "with valid information" do 
      let(:new_name)  { "New Product Name" }
      let(:new_image) { "image.png" }

      before do
        fill_in "Name",         with: new_name
        fill_in "Image",        with: new_image
        fill_in "Price",        with: product.price
        fill_in "Description",  with: product.description
        click_button "Save changes"
      end

      it { should have_selector('title', text: product.code) }
      it { should have_selector('h1', text: new_name) }
      it { should have_selector('div.alert.alert-success') }

      specify { product.reload.name.should  == new_name }
      specify { product.reload.image.should == new_image }
    end
  end

  describe "new page" do
    let(:admin) { FactoryGirl.create(:admin) }
    before do
      sign_in admin
      visit new_product_path 
    end

    let(:submit) { "Create product" }

    describe "with invalid information" do
      it "should not create a product" do
        expect { click_button submit }.not_to change(Product, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_selector('title', text: 'New Product') }
        it { should have_selector('h1', text: 'New product') }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example Product"
        fill_in "Image",        with: "c000001.png"
        fill_in "Price",        with: 99.99
        fill_in "Description",  with: "This is a description for example product"
      end

      it "should create a product" do
        expect { click_button submit }.to change(Product, :count).by(1)
      end

      describe "after saving the product" do
        before { click_button submit }
        let(:product) { Product.find_by_name('Example Product') }

        it { should have_selector('title', text: product.code) }
        it { should have_selector('div.alert.alert-success', text: 'Product was successfully created') }
        it { should have_link('Edit') }
        it { should have_link('Back') }
      end

    end
  end


   

end

