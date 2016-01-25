ActiveAdmin.register MetaTag do
  permit_params :attr, :attr_value, :content, :tag_type, :content_type, page_ids: []

  index do
    selectable_column
    column :tag_type
    column :attr
    column :attr_value
    column :content_type
    column :content do |meta_tag|
      meta_tag.content.truncate(75)
    end
    column :pages do |meta_tag|
      meta_tag.pages.pluck(:name).join ", "
    end

    actions
  end

  form do |f|
    f.inputs do
      f.input :tag_type
      f.input :attr
      f.input :attr_value
      f.input :content_type
      f.input :content, as: :string
      f.input :pages, as: :check_boxes, collection: Page.all
    end
    f.actions
  end

  show do
    attributes_table do
      row :tag_type
      row :attr
      row :attr_value
      row :content_type
      row :content
      row :pages do |meta_tag|
        meta_tag.pages.map(&:name).join(", ")
      end
    end
  end
end
