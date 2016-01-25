class AddContentTypeToMetaTags < ActiveRecord::Migration
  def change
    add_column :meta_tags, :content_type, :string
  end
end
