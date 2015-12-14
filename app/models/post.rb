class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]
  has_many :tags

  def normalize_friendly_id(string)
    date = (created_at || Time.now).strftime("%Y/%m/%d")
    "/posts/#{date}/#{super}"
  end

  def self.blogs
    where(use: "blog")
  end

  def self.recent
    order("created_at").reverse_order
  end
end