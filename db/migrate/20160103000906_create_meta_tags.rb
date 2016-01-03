class CreateMetaTags < ActiveRecord::Migration
  def change
    create_table :meta_tags do |t|
      t.string :type
      t.text :content
      t.integer :page_id
    end
  end
end
