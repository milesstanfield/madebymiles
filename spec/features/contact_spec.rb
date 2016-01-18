require "spec_helper"

describe "contact page", type: :feature do
  before :each do
    visit "/contact"
  end

  it "has a contact header" do
    expect(page).to have_text "Contact me"
  end

  it "has submits a message" do
    within "form" do
      fill_in "message_sender_name", with: "Jo Biden"
      fill_in "message_sender_email", with: "jobiden@gmail.com"
      fill_in "message_subject", with: "a question"
      fill_in "message_body", with: "this is my question"
      click_button "Submit"
    end
    expect(page).to have_text "Message submitted successfully!"
  end

  it "fails to submit a message with invalid email" do
    within "form" do
      fill_in "message_sender_name", with: "Jo Biden"
      fill_in "message_sender_email", with: "invalidemail"
      fill_in "message_subject", with: "a question"
      fill_in "message_body", with: "this is my question"
      click_button "Submit"
    end
    expect(page).to have_text "Oops! There was a problem with the email address you provided"
  end

  it "fails to submit a message with empty email" do
    within "form" do
      fill_in "message_sender_name", with: "Jo Biden"
      click_button "Submit"
    end
    expect(page).to have_text "Oops! There was a problem with the email address you provided"
  end
end
