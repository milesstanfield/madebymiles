class Image < ActiveRecord::Base
  belongs_to :portfolio
  mount_uploader :file
end