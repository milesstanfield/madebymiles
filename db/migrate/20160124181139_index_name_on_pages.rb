class IndexNameOnPages < ActiveRecord::Migration
  def change
    add_index :pages, :name
  end
end
