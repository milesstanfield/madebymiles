class RemovePageIdFromMetaTags < ActiveRecord::Migration
  def change
    remove_column :meta_tags, :page_id, :integer
  end
end
