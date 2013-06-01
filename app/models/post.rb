class Post < ActiveRecord::Base
  attr_accessible :content, :user_id
  validates :content, :length => { :maximum => 144}
  belongs_to :user
end
