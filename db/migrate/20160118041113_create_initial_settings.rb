class CreateInitialSettings < ActiveRecord::Migration
  class Setting < ActiveRecord::Base
  end

  def up
    Setting.create(
      stack_overflow: "http://stackoverflow.com/users/3123370/milesstanfield",
      github: "https://github.com/milesstanfield",
      facebook: "http://localhost:3000/contact",
      twitter: "https://twitter.com/milesua",
      email: "http://localhost:3000/mailto:miles@madebymiles.com"
    )
  end

  def down
    Setting.where(
      stack_overflow: "http://stackoverflow.com/users/3123370/milesstanfield",
      github: "https://github.com/milesstanfield",
      facebook: "http://localhost:3000/contact",
      twitter: "https://twitter.com/milesua",
      email: "http://localhost:3000/mailto:miles@madebymiles.com"
    ).first.destroy
  end
end
