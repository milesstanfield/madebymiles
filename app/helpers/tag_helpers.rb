module TagHelpers
  def inline_link(text, path, args = {})
    link_to text, path, args.merge(class: "m-font-bold m-font-medium m-color-blue a-inline-link-hover")
  end

  def meta_tag(meta_tag_record)
    "<meta #{meta_tag_record.attr}='#{meta_tag_record.attr_value}' content='#{meta_tag_record.content}'></meta>".html_safe
  end
end