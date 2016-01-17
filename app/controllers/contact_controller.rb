class ContactController < ApplicationController
  before_action :load_settings

  def index
    page = Page.by_name_or_create "contact"
    @active_nav_tab = page.active_nav_tab
    @title_tag = page.title_tag
    @meta_tags = page.meta_tags
    @message = Message.new
  end

  def message
    saved_message = Message.new(message_params).save
    saved_message ? flash_success_notice : flash_error_notice
    redirect_to contact_path message_params.merge(success: saved_message)
  end

  private

  def message_params
    params.require(:message).permit(:sender_name, :sender_email, :subject, :body)
  end

  def flash_success_notice
    flash[:notice] = "Message submitted successfully!"
  end

  def flash_error_notice
    flash[:notice] = "Oops! There was a problem with the email address you provided"
  end
end
