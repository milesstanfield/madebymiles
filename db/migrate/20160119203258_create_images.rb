class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :file
      t.integer :portfolio_id
      t.integer :post_id
    end
  end
end
