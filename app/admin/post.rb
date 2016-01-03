ActiveAdmin.register Post do
  permit_params :title, :body, :use, :slug, :teaser
  scope :blog
  scope :tutorials
  menu priority: 1

  filter :title
  filter :teaser
  filter :use
  filter :body

  index do
    selectable_column
    column :title
    column :use
    column "link" do |post|
      link_to post.slug, post.path
    end
    actions
  end
end
