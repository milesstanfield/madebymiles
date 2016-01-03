ActiveAdmin.register Page do
  permit_params :name, :active_nab_tab, :title_tag
  before_filter :skip_sidebar!, only: :index

  index do
    selectable_column
    column :name
    actions
  end
end
