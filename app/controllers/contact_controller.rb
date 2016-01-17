class ContactController < ApplicationController
  def index
    page = Page.by_name_or_create "contact"
    @active_nav_tab = page.active_nav_tab
    @title_tag = page.title_tag
    @meta_tags = page.meta_tags
    @message = Message.new
  end

  def message
    Message.create(message_params) ? flash_success_notice : flash_error_notice
    redirect_to contact_path
  end

  private

  def message_params
    params.require(:message).permit(:sender_name, :sender_email, :subject, :body)
  end

  def flash_success_notice
    flash[:notice] = "Message submitted successfully!"
  end

  def flash_error_notice
    flash[:notice] = "Oops there was a problem"
  end
end
