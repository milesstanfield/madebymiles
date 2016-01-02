ActiveAdmin.register FeatureFlipper do
  permit_params :name, :active

  filter :name
  filter :active

end
