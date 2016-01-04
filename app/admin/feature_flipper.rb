ActiveAdmin.register FeatureFlipper do
  permit_params :name, :active
  before_filter :skip_sidebar!, only: :index

  form do |f|
    f.inputs do
      f.input :name, as: :select, collection: FeatureFlipper.available_names
      f.input :active, as: :boolean
    end
    f.actions
  end
end
