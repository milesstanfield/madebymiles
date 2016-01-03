ActiveAdmin.register MetaTag do
  permit_params :use, :use_value, :content

  index do
    selectable_column
    column :attr
    column :attr_value
    column :content
    actions
  end
end
