class Portfolio < ActiveRecord::Base
  has_many :images
  has_many :cover_images
  scope :recent, -> { order("created_at").reverse_order }
  validates :teaser, length: {maximum: 300}

  def cover_image=(image)
    self.cover_images = []
    self.save
    self.cover_images << image
  end

  def cover_image_url
    cover_images.first.file.url
  end
end
