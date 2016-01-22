class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :title
      t.text :teaser
      t.text :body

      t.timestamps
    end
  end
end
