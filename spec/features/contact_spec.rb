require "spec_helper"

describe "contact page", type: :feature do
  before do
    create_setting
  end

  before :each do
    visit "/contact"
  end

  it "has a contact header" do
    expect(page).to have_text "Contact me"
  end

  it "has an 'other' area with other links" do
    within "[data-area='other']" do
      expect(page).to have_css ".stack_overflow_blue"
      expect(page).to have_css "a[href='http://stackoverflow.com/users/3123370/milesstanfield']"
      expect(page).to have_css ".github_blue"
      expect(page).to have_css "a[href='https://github.com/milesstanfield']"
      expect(page).to have_css ".facebook_blue"
      expect(page).to have_css "a[href='/contact']"
      expect(page).to have_css ".twitter_blue"
      expect(page).to have_css "a[href='https://twitter.com/milesua']"
      expect(page).to have_css ".email_icon_blue"
      expect(page).to have_css "a[href='mailto:miles@madebymiles.com']"
    end
  end

  it "has submits a message" do
    within "form" do
      fill_in "message_sender_name", with: "Jo Biden"
      fill_in "message_sender_email", with: "jobiden@gmail.com"
      fill_in "message_subject", with: "a question"
      fill_in "message_body", with: "this is my question"
      click_button "Submit"
    end
    expect(page).to have_text success_notice
  end

  it "fails to submit a message with invalid email" do
    within "form" do
      fill_in "message_sender_name", with: "Jo Biden"
      fill_in "message_sender_email", with: "invalidemail"
      fill_in "message_subject", with: "a question"
      fill_in "message_body", with: "this is my question"
      click_button "Submit"
    end
    expect(page).to have_text failure_notice
  end

  it "fails to submit a message with empty email" do
    within "form" do
      fill_in "message_sender_name", with: "Jo Biden"
      click_button "Submit"
    end
    expect(page).to have_text failure_notice
  end

  it "passes previous input on failure redirect" do
    within "form" do
      fill_in "message_sender_name", with: "Jo Biden"
      click_button "Submit"
    end
    expect(page).to have_text failure_notice
    expect(page).to have_css "input[id='message_sender_name'][value='Jo Biden']"
  end

  def success_notice
    "Message submitted successfully!"
  end

  def failure_notice
    "Oops! There was a problem with the email address you provided"
  end
end
