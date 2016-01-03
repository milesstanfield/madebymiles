ActiveAdmin.register Page do
  permit_params :name, :active_nab_tab, :title_tag, :feature_flippers, :meta_tags
end
