class PostPresenter < SimpleDelegator
  def initialize(post)
    @post = post
    super(post)
  end

  def markdown_body
    markdown = Redcarpet::Markdown.new(CustomMarkdown)
    markdown.render(@post.body).html_safe
  end
end
