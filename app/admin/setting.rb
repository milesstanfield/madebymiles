ActiveAdmin.register Setting do
  permit_params :github, :facebook, :twitter, :stack_overflow, :email
  menu parent: 'Administrative'
  actions :all, :except => [:new, :destroy]

  controller do
    def index
      setting = Setting.count > 0 ? Setting.first : Setting.create
      redirect_to edit_admin_setting_path(setting)
    end
  end

  index do
    column "setting" do |setting|
      setting.id
    end
    actions
  end
end
