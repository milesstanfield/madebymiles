ActiveAdmin.register Setting do
  permit_params :github, :facebook, :twitter, :stack_overflow, :email

  index do
    column "setting" do |setting|
      setting.id
    end
    actions
  end
end
