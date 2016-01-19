ActiveAdmin.register Portfolio do
  permit_params :title, :teaser, :body, image_ids: []

  index do
    column :title
    column :teaser
    actions
  end

  # show do
  #   attributes_table do
  #     row :title
  #     row :images do |image|
  #       "<img style='height:200px;' src='#{image.file.url}'/>".html_safe
  #     end
  #   end
  # end
  #
  form do |f|
    f.inputs do
      f.input :title
      f.input :teaser, as: :string
      f.input :body
      f.input :images, as: :check_boxes, collection: Image.all
    end
    f.actions
  end
end
