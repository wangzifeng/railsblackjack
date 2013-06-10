class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  before_save { |user| user.email = user.email.downcase } 
  before_save :create_remember_token

  validates :name, :presence => true, :length => { maximum: 20 }
  #VALID_EMAIL_REGEX = /A[\w+\-.]+@[\w+\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,#, :format => { :with => VALID_EMAIL_REGEX }, 
                                      :uniqueness => { case_sensitive: false }
  
  validates :password, :presence => true, :length => { minimum: 3 }
  validates :password_confirmation, :presence => true

  has_many :posts

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end

