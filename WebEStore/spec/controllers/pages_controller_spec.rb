require 'spec_helper'

describe "PagesController" do

  subject { page }

  describe "'home' page" do
    before { visit root_path }

    it { should have_selector('h1',    text: 'e-Store') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector 'title', text: full_title('Home') }
    it { body.should_not =~ /<body>\s*<\/body>/ }

  end

  describe "'contact' page" do
    before { visit contact_path }

    it { should have_selector('h1',    text: 'Contact') }
    it { should have_selector('title', text: full_title('Contact')) }

  end

  describe "'about' page" do
    before { visit about_path }

    it { should have_selector('h1',    text: 'About') }
    it { should have_selector('title', text: full_title('About')) }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1',    text: 'Help') }
    it { should have_selector('title', text: full_title('Help')) }
  end

  it "should have the right links on the layout" do
    visit root_path
    page.should have_selector 'title', text: full_title('')
    click_link "About"
    page.should have_selector 'title', text: full_title('About')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    page.should have_selector 'title', text: full_title('')
    click_link "Sign up"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "e-Store"
    page.should have_selector 'title', text: full_title('')
  end

end