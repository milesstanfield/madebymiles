class FeatureFlipper < ActiveRecord::Base
  validates :name, uniqueness: true
  belongs_to :page

  def self.available_names
    ["home", "about", "portfolio", "contact", "tutorials", "blog", "testimonials", "404", "search"]
  end

  def self.active_names
    where(active: true).map(&:name)
  end
end
