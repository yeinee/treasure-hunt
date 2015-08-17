class Attachment < ActiveRecord::Base
  belongs_to :parent, polymorphic: true
  mount_uploader :file, S3Uploader

  validates :file, presence: true
end
