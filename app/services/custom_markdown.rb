include TagHelpers

class CustomMarkdown < Redcarpet::Render::HTML
  def block_quote(quote)
    quote_tag(quote)
  end

  def link(link, title, content)
    custom_link(content, link)
  end

  def image(url, title, alt_text)
    full_image(url, alt_text)
  end
end
