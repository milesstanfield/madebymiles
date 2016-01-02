ActiveAdmin.register Post do
  permit_params :title, :body, :use, :slug, :teaser
  menu priority: 1

  filter :title
  filter :teaser
  filter :use
  filter :body

end
