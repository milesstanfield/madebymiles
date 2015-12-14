class RemovePathFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :path, :string
  end
end
