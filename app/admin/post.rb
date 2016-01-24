ActiveAdmin.register Post do
  permit_params :title, :body, :use, :slug, :teaser, :published
  scope :blog
  scope :tutorials
  scope :published

  filter :title
  filter :teaser
  filter :use
  filter :body
  filter :published

  index do
    selectable_column
    column :title
    column :use
    column "link" do |post|
      link_to post.slug, post.path
    end
    column :published
    actions
  end

  form do |f|
    f.inputs do
      f.input :published
      f.input :title
      f.input :teaser
      f.input :body
      f.input :use, as: :select, collection: Post.available_uses
      f.input :tags, as: :check_boxes, collection: Tag.all.order(:name)
    end
    f.actions
  end
end
