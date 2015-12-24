class FeatureFlipper < ActiveRecord::Base
  validates :name, uniqueness: true

  def self.active_names
    where(active: true).map(&:name)
  end
end
