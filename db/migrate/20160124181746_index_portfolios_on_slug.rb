class IndexPortfoliosOnSlug < ActiveRecord::Migration
  def change
    add_index :portfolios, :slug
  end
end
