class CreateCoverImages < ActiveRecord::Migration
  def change
    create_table :cover_images do |t|
      t.string :file
      t.string :title
      t.integer :portfolio_id
    end
  end
end
