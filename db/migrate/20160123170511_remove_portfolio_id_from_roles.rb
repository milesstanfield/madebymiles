class RemovePortfolioIdFromRoles < ActiveRecord::Migration
  def change
    remove_column :roles, :portfolio_id, :integer
  end
end
