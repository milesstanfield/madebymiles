require "spec_helper"

describe ContactController, type: :controller do
  it "#index" do
    page = double(:page, name: "contact", active_nav_tab: "contact", title_tag: "contact", meta_tags: [])
    expect(Page).to receive(:find_by_name).with(page.name).and_return(page)
    expect(page).to receive(:active_nav_tab).and_return(page.active_nav_tab)
    expect(page).to receive(:title_tag).and_return(page.title_tag)
    expect(page).to receive(:meta_tags).and_return(page.meta_tags)
    expect(Message).to receive(:new)
    expect(Setting).to receive(:first_or_create).and_return(double(:setting))
    get :index
    expect(response).to render_template :index
    expect(assigns(:active_nav_tab)).to eq "contact"
    expect(assigns(:title_tag)).to eq "contact"
    expect(assigns(:meta_tags)).to eq []
    expect(assigns(:new_message)).to eq nil
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
      message = double(:message)
      expect(Message).to receive(:new).with(record_params).and_return(message)
      expect(message).to receive(:save).and_return(true)
      expect(controller).to receive(:flash_success_notice)
      expect(Setting).to receive(:first_or_create).and_return(double(:setting))
      post :message, message_params
      expect(response).to redirect_to "/contact?body=there+is+no+cake&sender_email=jo%40jo.com&sender_name=Jo&subject=Talky+talky&success=true"
    end

    it "errors on saving message and redirects to contact page" do
      message_params = {
        message: {
          sender_name: "Jo",
        }
      }
      record_params = { sender_name: "Jo" }
      message = double(:message)
      expect(Message).to receive(:new).with(record_params).and_return(message)
      expect(message).to receive(:save).and_return(false)
      expect(controller).to receive(:flash_error_notice)
      expect(Setting).to receive(:first_or_create).and_return(double(:setting))
      post :message, message_params
      expect(response).to redirect_to "/contact?sender_name=Jo&success=false"
    end
  end
end