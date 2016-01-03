class Page < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  has_many :feature_flippers
  has_many :meta_tags
end
