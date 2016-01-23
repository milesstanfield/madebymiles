class Portfolio < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]
  has_many :images
  has_and_belongs_to_many :roles
  has_many :cover_images
  scope :recent, -> { order("created_at").reverse_order }
  validates :teaser, length: {maximum: 300}
  validates :cover_images, presence: true

  def cover_image_url
    cover_images.first.file.url
  end

  def normalize_friendly_id(string)
    date = (created_at || Time.now).strftime("%Y/%m/%d")
    "#{date}/#{super}"
  end

  def path
    "/portfolios/#{slug}"
  end

  def self.by_role(role)
    where(id: includes(:roles).where(roles: { title: role }).map(&:id))
  end
end
