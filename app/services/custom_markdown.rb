include TagHelpers

class CustomMarkdown < Redcarpet::Render::HTML
  def block_quote(quote)
    quote_tag(quote)
  end

  def link(link, title, content)
    custom_link(content, link)
  end

  def image(url, title, alt_text)
    if internal?(url)
      internal_image = Image.find_by_title url.split(internal_matcher).last
      url = internal_image.file.url
    end
    full_image(url, alt_text)
  end

  private

  def internal?(url)
    url[0..8] == internal_matcher
  end

  def internal_matcher
    "internal "
  end
end
