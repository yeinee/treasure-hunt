class Reply < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  # 빈 댓글 금지
  validates :content, presence: true
end
