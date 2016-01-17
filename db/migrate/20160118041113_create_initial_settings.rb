class CreateInitialSettings < ActiveRecord::Migration
  class Setting < ActiveRecord::Base
  end

  def up
    Setting.create(
      stack_overflow: "http://stackoverflow.com/users/3123370/milesstanfield",
      github: "https://github.com/milesstanfield",
      facebook: "/contact",
      twitter: "https://twitter.com/milesua",
      email: "mailto:miles@madebymiles.com"
    )
  end

  def down
    Setting.where(
      stack_overflow: "http://stackoverflow.com/users/3123370/milesstanfield",
      github: "https://github.com/milesstanfield",
      facebook: "/contact",
      twitter: "https://twitter.com/milesua",
      email: "mailto:miles@madebymiles.com"
    ).first.destroy
  end
end
