module TagHelpers
  def custom_link(text, path)
    "<a href='#{path}' class='#{link_classes}'>#{text}</a>".html_safe
  end

  def inline_link(text, path, args = {})
    link_to text, path, args.merge(class: link_classes)
  end

  def meta_tag(meta_tag_record)
    "<#{meta_tag_record.tag_type} #{meta_tag_record.attr}='#{meta_tag_record.attr_value}' content='#{meta_tag_record.content}'></#{meta_tag_record.tag_type}>".html_safe
  end

  def quote_tag(quote)
    "<p class='l-medium-padding m-bg-quote'>quote</p>".html_safe
  end

  def full_image(url, alt_text)
    "<img src='#{url}' alt='#{alt_text}' class='l-width-100'".html_safe
  end

  private

  def link_classes
    "m-bold m-medium m-color-blue a-inline-link-hover"
  end
end