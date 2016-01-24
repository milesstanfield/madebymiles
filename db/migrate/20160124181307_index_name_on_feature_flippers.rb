class IndexNameOnFeatureFlippers < ActiveRecord::Migration
  def change
    add_index :feature_flippers, :name
  end
end
