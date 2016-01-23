class CreatePortfoliosRoles < ActiveRecord::Migration
  def change
    create_table :portfolios_roles, id: false do |t|
      t.belongs_to :portfolio, index: true
      t.belongs_to :role, index: true
    end
  end
end
