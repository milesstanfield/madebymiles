ActiveAdmin.register MetaTag do
  permit_params :type, :type_value, :content, :page_id
end
