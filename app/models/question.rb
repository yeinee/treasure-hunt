class Question < ActiveRecord::Base
  belongs_to :post
  has_many :attachments, as: :parent

  validates :content, presence: true
  validates :answer, presence: true
end
