class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]
  scope :blog, -> { where use: "blog" }
  scope :tutorials, -> { where use: "tutorial" }
  scope :recent, -> { order("created_at").reverse_order }
  has_and_belongs_to_many :tags
  validates :title, presence: true
  validates :use, presence: true
  validates :body, presence: true
  has_many :images

  def normalize_friendly_id(string)
    date = (created_at || Time.now).strftime("%Y/%m/%d")
    "#{date}/#{super}"
  end

  def path
    "/posts/#{slug}"
  end

  def self.by_tag_name(tag_name)
    where(id: includes(:tags).where(tags: { name: tag_name }).map(&:id))
  end

  def self.available_uses
    ["blog", "tutorial"]
  end
end
