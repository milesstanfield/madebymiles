class AddIndexToPublishedOnPortfolios < ActiveRecord::Migration
  def change
    add_index :portfolios, :published
  end
end
