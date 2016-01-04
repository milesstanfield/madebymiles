ActiveAdmin.register MetaTag do
  permit_params :attr, :attr_value, :content, page_ids: []

  index do
    selectable_column
    column :attr
    column :attr_value
    column :content
    column :pages do |meta_tag|
      meta_tag.pages.pluck(:name).join ", "
    end

    actions
  end

  form do |f|
    f.inputs do
      f.input :attr
      f.input :attr_value
      f.input :content, as: :string
      f.input :pages, as: :check_boxes, collection: Page.all
    end
    f.actions
  end

  show do
    attributes_table do
      row :attr
      row :attr_value
      row :content
      row :pages do |meta_tag|
        meta_tag.pages.map(&:name).join(", ")
      end
    end
  end
end
