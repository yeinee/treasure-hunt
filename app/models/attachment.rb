class Attachment < ActiveRecord::Base
  belongs_to :parent, polymorphic: true
  mount_uploader :file, S3Uploader

  # 파일 없이 attachment row 생성 방
  validates :file, presence: true
end
