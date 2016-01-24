class Image < ActiveRecord::Base
  belongs_to :post
  belongs_to :portfolio
  mount_uploader :file, FileUploader
  validates :title, presence: true, uniqueness: true
end