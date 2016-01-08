class PostPresenter < SimpleDelegator
  def initialize(post, controller)
    @post = post
    @controller = controller
    @view_context = @controller.view_context
    super(post)
  end

  def markdown_body
    renderer = Redcarpet::Render::HTML.new(render_options = {})
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(@post.body).html_safe
  end
end
