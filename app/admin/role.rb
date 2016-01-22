ActiveAdmin.register Role do
  permit_params :title, :portfolio_id

  index do
    selectable_column
    column :title
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :portfolio, as: :select, collection: Portfolio.all
    end
    f.actions
  end
end
