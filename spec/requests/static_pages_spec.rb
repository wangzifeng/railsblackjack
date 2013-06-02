require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "Should have the content 'Sample app'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end

    it "Should have the title of 'Sample app'" do
      visit '/static_pages/home'
      page.should have_title("Sample App")
    end

  end

  describe "Page" do
    it "Should have the content 'Help'" do
      visit '/static_pages/page'
      page.should have_content('Page')
      #page.should have_selector('h1', :text => 'Pages')
      #page.should have_selector('title', :text => 'Pages')
    end

    it "Should have the title of 'Page'" do
      visit '/static_pages/page'
      page.should have_title("Page")
    end
  end

  describe "About Page" do
    it "Should have the content 'About US'" do
      visit '/static_pages/about'
      page.should have_content('About US')
    end

    it "Should have the title of 'About'" do
      visit '/static_pages/about'
      page.should have_title("About US")
    end
  end

  describe "Contact Page" do
    it "Should have the content 'Contact'" do
      visit '/static_pages/contact'
      page.should have_content('Contact')
    end

    it "Should have the title of 'Contact'" do
      visit '/static_pages/contact'
      page.should have_title("Contact")
    end
  end

end
