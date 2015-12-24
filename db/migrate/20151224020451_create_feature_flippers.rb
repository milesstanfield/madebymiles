class CreateFeatureFlippers < ActiveRecord::Migration
  def change
    create_table :feature_flippers do |t|
      t.boolean :active
      t.string :name
    end
  end
end
