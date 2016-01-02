include SeedHelpers

# create posts and associated tags
create_posts_and_tags "blog"
create_posts_and_tags "tutorial"

# active flippers
create_activate_flippers "home", "about", "tutorials", "portfolio", "blog", "connect", "testimonials"

create_admin_user

puts "done"