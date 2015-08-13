class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :hunter, class_name: 'User'
end
