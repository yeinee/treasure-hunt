class Question < ActiveRecord::Base
  belongs_to :post
  has_many :attachments, as: :parent
end
