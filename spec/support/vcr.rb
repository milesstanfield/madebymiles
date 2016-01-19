VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true

  c.default_cassette_options = {
    match_requests_on: [:uri]
  }

  c.filter_sensitive_data("ENV['MAILGUN_API_KEY']") do
    ENV['MAILGUN_API_KEY']
  end
  c.filter_sensitive_data("ENV['MAILGUN_DOMAIN']") do
    ENV['MAILGUN_DOMAIN']
  end
  c.filter_sensitive_data("ENV['AWS_SECRET_ACCESS_KEY']") do
    ENV['AWS_SECRET_ACCESS_KEY']
  end
  c.filter_sensitive_data("ENV['AWS_ACCESS_KEY_ID']") do
    ENV['AWS_ACCESS_KEY_ID']
  end
end
