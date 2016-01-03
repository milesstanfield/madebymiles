class AddPageIdToFeatureFlippers < ActiveRecord::Migration
  def change
    add_column :feature_flippers, :page_id, :integer
  end
end
