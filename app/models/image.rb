class Image < ActiveRecord::Base
  belongs_to :post
  belongs_to :portfolio
  mount_uploader :file, FileUploader
end