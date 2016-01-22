class PortfolioPresenter < SimpleDelegator
  def initialize(portfolio)
    @portfolio = portfolio
    super(portfolio)
  end

  def markdown_body
    markdown = Redcarpet::Markdown.new(CustomMarkdown)
    markdown.render(@portfolio.body).html_safe
  end
end
