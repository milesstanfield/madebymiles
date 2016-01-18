class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :github
      t.string :facebook
      t.string :twitter
      t.string :stack_overflow
      t.string :email
    end
  end
end
