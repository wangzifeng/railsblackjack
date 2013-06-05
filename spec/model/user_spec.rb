require 'spec_helper'

# Test for user model

describe User do
  before { @user = User.new(name: "Frank W", email: "example@example.com", 
                            password: "password", password_confirmation: "password")}

  subject { @user }

  it { should respond_to(:name)}  
  it { should respond_to(:email)}
  it { should respond_to(:password)}
  it { should respond_to(:password_digest)}
  it { should respond_to(:password_confirmation)}
  it { should respond_to(:authenticate)}


  it { should be_valid}

  describe "When name is not presented" do
    before {@user.name = " "}
    it { should_not be_valid }
  end 

  describe "When email is not presented" do
    before {@user.email = " " }
    it { should_not be_valid }
  end

  describe "When user name is too long" do
    before {@user.name = "a" * 50 }
    it { should_not be_valid}
  end

  describe "When email format is invalid" do

    #regular impression issue should be fixed
    it "should be invalid" do
      address = %w[user@foo,com user_at_foo.org user.foo@goo.]
      address.each do |invalid_email|
        @user.email = invalid_email
        @user.should_not be_valid
      end
    end
  end

  describe "email is already taken" do

    #use before block to setup variables;

    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it {should_not be_valid }
  end


  describe "if password is not set" do
    before do 
      @user.password = " "
      @user.password_confirmation = " "
    end

    it {should_not be_valid}
  end

  describe "if password confirmation is mismatch" do
    before { @user.password_confirmation = "fuck"}
    it {should_not be_valid}
  end

  describe "if password_confirmation is nil" do
    before { @user.password_confirmation = nil }
    it {should_not be_valid}
  end

  describe "if password length is less than 6 digits" do
    before { @user.password = @user.password_confirmation = "a"*2}
    it {should_not be_valid}
  end

  describe "return value of authenticate method" do
    before { @user.save }

    let(:found_user) { User.find_by_email(@user.email)}

    describe "with valid password" do 
      it {should == found_user.authenticate(@user.password)}
    end

    describe "with invalide password" do
      let(:user_for_invalide_password) { found_user.authenticate("invalid")}
      it {should_not == user_for_invalide_password }
      specify {user_for_invalide_password.should be_false }
    end

  end  
end
