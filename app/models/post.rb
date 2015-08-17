class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :hunter, class_name: 'User'

  has_many :attachments, as: :parent
  has_many :engage_states
  has_many :questions
  has_many :post_ratings
  has_many :replies

  #post의 user가 nil이면 뱉어
  validates :user, presence: true

  #nested_form을 써주기 위함
  accepts_nested_attributes_for :questions, :allow_destroy => true
end
