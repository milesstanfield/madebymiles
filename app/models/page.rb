class Page < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  has_many :feature_flippers
  has_many :meta_tags

  def self.by_name_or_create(name)
    find_by_name(name) || create(name: name)
  end
end
