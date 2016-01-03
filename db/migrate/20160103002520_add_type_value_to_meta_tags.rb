class AddTypeValueToMetaTags < ActiveRecord::Migration
  def change
    add_column :meta_tags, :type_value, :string
  end
end
