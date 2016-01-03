class RenameTypeColumnForMetaTags < ActiveRecord::Migration
  def change
    rename_column :meta_tags, :type, :attr
    rename_column :meta_tags, :type_value, :attr_value
  end
end
