class IndexNameOnTags < ActiveRecord::Migration
  def change
    add_index :tags, :name
  end
end
