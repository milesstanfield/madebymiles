class FeatureFlipper < ActiveRecord::Base
  validates :name, uniqueness: true
  belongs_to :page

  def self.active_names
    where(active: true).map(&:name)
  end
end
