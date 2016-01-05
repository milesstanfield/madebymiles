ActiveAdmin.register Page do
  permit_params :name, :active_nav_tab, :title_tag, meta_tag_ids: []
  before_filter :skip_sidebar!, only: :index

  index do
    selectable_column
    column :name
    column :active? do |page|
      FeatureFlipper.active_names.include?(page.name) ? "yes" : "no"
    end
    actions
  end

  controller do
    helper TagHelpers
  end

  form do |f|
    f.inputs do
      f.input :name, as: :select, collection: Page.available_names
      f.input :active_nav_tab
      f.input :title_tag
    end
    f.actions
  end
end
