include SeedHelpers

create_posts_and_tags "blog"
create_posts_and_tags "tutorial"
create_activate_flippers
create_pages_and_associated
create_setting
create_admin_user
create_portfolio_and_related
create_portfolio_and_related :google2, "My Fake Portfolio 2"
create_portfolio_and_related :google3, "My Fake Portfolio 3"

puts "done"