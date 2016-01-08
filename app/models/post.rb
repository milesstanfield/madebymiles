class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]
  scope :blog, -> { where use: "blog" }
  scope :tutorials, -> { where use: "tutorial" }
  has_and_belongs_to_many :tags
  validates :title, presence: true
  validates :use, presence: true
  validates :body, presence: true

  def normalize_friendly_id(string)
    date = (created_at || Time.now).strftime("%Y/%m/%d")
    "#{date}/#{super}"
  end

  def path
    "/posts/#{slug}"
  end

  class << self
    def recent
      order("created_at").reverse_order
    end

    def by_tag_name(tag_name)
      includes(:tags).where(tags: { name: tag_name })
    end

    def available_uses
      ["blog", "tutorial"]
    end
  end
end
