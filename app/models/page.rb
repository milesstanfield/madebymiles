class Page < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  has_many :feature_flippers
  has_and_belongs_to_many :meta_tags

  def self.available_names
    ["home", "about", "tutorials", "portfolio", "blog", "contact", "404", "search"]
  end

  def self.by_name_or_create(name)
    find_by_name(name) || create(name: name)
  end
end
