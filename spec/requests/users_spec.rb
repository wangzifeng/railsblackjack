require 'spec_helper'

describe "User Page" do

  subject { page }

  describe "Sign Up" do

    before { visit signup_path } 

    it { should have_selector('h1', text: 'Sign Up')}

    it { should have_title(full_title('Sign Up'))}

  end

  describe "Profile" do

    before { visit profile_path } 

    it { should have_selector('h1', text: 'Profile')}

    it { should have_title(full_title('Profile'))}

  end

end