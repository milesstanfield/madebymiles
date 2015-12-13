class Navigation
  def self.tabs
    [
      tab_struct("home", "/"),
      tab_struct("about", "/about"),
      tab_struct("blog", "/blog"),
      tab_struct("portfolio", "/porfolio"),
      tab_struct("connect", "/connect"),
    ]
  end

  private

  def self.tab_struct(text, path)
    OpenStruct.new(text: text, path: path)
  end
end