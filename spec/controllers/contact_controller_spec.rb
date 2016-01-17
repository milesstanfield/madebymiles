require "spec_helper"

describe ContactController, type: :controller do
  it "#index" do
    page = double(:page, name: "contact", active_nav_tab: "contact", title_tag: "contact", meta_tags: [])
    expect(Page).to receive(:find_by_name).with(page.name).and_return(page)
    expect(page).to receive(:active_nav_tab).and_return(page.active_nav_tab)
    expect(page).to receive(:title_tag).and_return(page.title_tag)
    expect(page).to receive(:meta_tags).and_return(page.meta_tags)
    expect(Message).to receive(:new)
    get :index
    expect(assigns(:active_nav_tab)).to eq "contact"
    expect(assigns(:title_tag)).to eq "contact"
    expect(assigns(:meta_tags)).to eq []
    expect(assigns(:new_message)).to eq nil
    expect(response).to render_template :index
  end

  context "post #message" do
    it "successfully saves message and redirects to contact page" do
      message_params = {
        message: {
          sender_name: "Jo",
          sender_email: "jo@jo.com",
          subject: "Talky talky",
          body: "there is no cake"
        }
      }
      record_params = {
        sender_name: "Jo",
        sender_email: "jo@jo.com",
        subject: "Talky talky",
        body: "there is no cake"
      }
      expect(Message).to receive(:create).with(record_params).and_return(true)
      expect(controller).to receive(:flash_success_notice)
      post :message, message_params
      expect(response).to redirect_to "/contact"
    end

    it "errors on saving message and redirects to contact page" do
      message_params = {
        message: {
          sender_name: "Jo",
        }
      }
      record_params = { sender_name: "Jo" }
      expect(Message).to receive(:create).with(record_params).and_return(nil)
      expect(controller).to receive(:flash_error_notice)
      post :message, message_params
      expect(response).to redirect_to "/contact"
    end
  end
end