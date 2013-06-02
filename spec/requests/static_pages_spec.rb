require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home Page" do

    before { visit root_path }

    it { should have_selector('h1', text: 'Sample App')}

    it { should have_title(full_title(''))} 

  end

  describe "Page" do
    before { visit page_path }

    it { should have_content('Page')}

    it { should have_title(full_title('Page'))} 
  end

  describe "About Page" do
    before { visit about_path } 

    it { should have_content('About US')} 

    it { should have_title(full_title('About US'))}
  end

  describe "Contact Page" do
    before { visit contact_path } 

    it { should have_content('Contact')}

    it { should have_title(full_title('Contact'))}
  end

end
