ActiveAdmin.register Image do
  permit_params :title, :file, :portfolio_id
  menu parent: "All Images"

  index do
    column :title
    column :usage do |image|
      "![](internal #{image.title})"
    end
    column :file do |image|
      "<img style='height:200px;' src='#{image.file.url}'/>".html_safe
    end
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
    end
    f.actions
  end
end
