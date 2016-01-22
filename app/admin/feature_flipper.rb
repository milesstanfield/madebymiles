ActiveAdmin.register FeatureFlipper do
  permit_params :name, :active
  before_filter :skip_sidebar!, only: :index
  menu parent: 'Administrative'
  config.sort_order = "name_asc"

  form do |f|
    f.inputs do
      f.input :name, as: :select, collection: FeatureFlipper.available_names
      f.input :active, as: :boolean
    end
    f.actions
  end

  index do
    column :name
    column :active
    actions
  end

  show do
    attributes_table do
      row :name
      row :active
    end
  end
end
