ActiveAdmin.register FeatureFlipper do
  permit_params :name, :active
  before_filter :skip_sidebar!, only: :index

  index do
    selectable_column
    column :name
    actions
  end
end
