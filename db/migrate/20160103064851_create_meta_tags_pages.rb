class CreateMetaTagsPages < ActiveRecord::Migration
  def change
    create_table :meta_tags_pages, id: false do |t|
      t.belongs_to :meta_tag, index: true
      t.belongs_to :page, index: true
    end
  end
end
