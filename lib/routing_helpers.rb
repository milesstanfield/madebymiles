module RoutingHelpers

  def post_slug_regex
    %r{\d{4}/\d{2}/\d{2}/[^/]+}
  end
end
