require 'spec_helper'

describe "AuthenticationPages" do

  subject { page }

  describe "sign in page" do
    before { visit signin_path}

    it { should have_selector('h1', text: 'Sign In')}
    it { should have_title(full_title('Sign In'))}

  end


  describe "sign in" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign In"}

      it { should have_title(full_title('Sign In'))}
      it { should have_selector('div.alert'), text: 'Invalid'}

    end

    describe "with valid information" do
      #let(:user){ User.find_by_email("info@wangzifeng.com")}

      before do
        fill_in "Email", with: "info@wangzifeng.com"
        fill_in "Password", with: "testtest"
        click_button "Sign In"
      end

      it { should have_title(full_title("Frank W"))}
      it { should have_link('Profile'), href: user_path}
      it { should have_link('Sign Out'), href: signout_path}
      it { should_not have_link('Sign In'), href: signin_path}

    end
  end
end
