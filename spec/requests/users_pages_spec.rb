require 'spec_helper'

describe "User Page" do

  subject { page }

  describe "Sign Up" do

    before { visit signup_path } 

    it { should have_selector('h1', text: 'Sign Up')}

    it { should have_title(full_title('Sign Up'))}

  end

  describe "Profile" do

    let(:user) { User.create(name: "Frank www", email: "info@wangzifeng.com",
                          password: "test", password_confirmation: "test")} 

    before { visit user_path(user) } 

    it { should have_selector('h1', text: user.name )}

    it { should have_title(full_title(user.name))}

  end
end

describe "Sign Up" do
    before {visit signup_path }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button "Create my account" }.not_to change(User, :count)
      end
    end

    describe "with valid information" do

      before {  fill_in "Name", with: "Example User"
                fill_in "Email", with: "test@erwrsfsdf.com"
                fill_in "Password", with: "testtest"
                fill_in "Confirmation", with: "testtest"} 

      it "should create a user" do
        expect { click_button "Create my account"  }.to change(User, :count).by(1)
      end
    end

    describe "after saving a user" do
      
      before { click_button "Create my account" }
      let(:user) {User.find_by_email("info@wangzifeng")}
      it { should have_title(user.name)}
    end
    
end