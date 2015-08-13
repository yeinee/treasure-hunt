class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :hunter, class_name: 'User'

  has_many :attachments, as: :parent
  has_many :engage_states
  has_many :questions
  has_many :post_ratings
  has_many :replies
end
