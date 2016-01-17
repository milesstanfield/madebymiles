class AddReadToMessages < ActiveRecord::Migration
  def up
    add_column :messages, :read, :boolean, default: false
  end

  def down
    add_column :messages, :read
  end
end
