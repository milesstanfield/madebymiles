module TagHelpers
  def inline_link(text, path, args = {})
    link_to text, path, args.merge(class: "m-font-bold m-font-medium m-color-blue a-inline-link-hover")
  end
end