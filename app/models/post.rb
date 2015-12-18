class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]
  has_and_belongs_to_many :tags

  def normalize_friendly_id(string)
    date = (created_at || Time.now).strftime("%Y/%m/%d")
    "/posts/#{date}/#{super}"
  end

  class << self
    def blog
      where(use: "blog")
    end

    def tutorials
      where(use: "tutorial")
    end

    def recent
      order("created_at").reverse_order
    end

    def by_tag_name(tag_name)
      Tag.find_by_name(tag_name).posts
    end
  end
end
