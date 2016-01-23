class CoverImage < ActiveRecord::Base
  belongs_to :portfolio
  mount_uploader :file, FileUploader
  attr_accessor :delete_icon
  before_validation { self.file.clear if self.delete_icon == '1' }
  validates :title, presence: true
end