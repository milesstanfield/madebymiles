ActiveAdmin.register Role do
  permit_params :title, portfolio_ids: []

  index do
    selectable_column
    column :title
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :portfolios, as: :check_boxes, collection: Portfolio.all
    end
    f.actions
  end
end
