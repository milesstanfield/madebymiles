class AddPublishedToPortfolios < ActiveRecord::Migration
  def change
    add_column :portfolios, :published, :boolean, default: false
  end
end
