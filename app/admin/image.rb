ActiveAdmin.register Image do
  permit_params :title, :file, :portfolio_id, :post_id
  menu parent: "All Images"

  index do
    column :title
    actions
  end

  show do
    attributes_table do
      row :title
      row :file do |image|
        "<img style='height:200px;' src='#{image.file.url}'/>".html_safe
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :file, :hint => "current uploaded file <br> <a href='#{f.object.file.url}'><img style='height:200px;' src='#{f.object.file.url}'/></a>".html_safe
      f.input :portfolio, as: :select, collection: Portfolio.all
      f.input :post, as: :select, collection: Post.all
    end
    f.actions
  end
end
