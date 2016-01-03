class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :title_tag
      t.string :active_nav_tab
    end
  end
end
