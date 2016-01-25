class AddTagTypeToMetaTags < ActiveRecord::Migration
  def change
    add_column :meta_tags, :tag_type, :string
  end
end
