class CoverImage < ActiveRecord::Base
  belongs_to :portfolio
  mount_uploader :file, FileUploader
  validates :title, presence: true, uniqueness: true
end
