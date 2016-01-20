include SeedHelpers

create_posts_and_tags "blog"
create_posts_and_tags "tutorial"
create_activate_flippers
create_pages_and_associated
create_setting
create_admin_user
create_portfolio

puts "done"