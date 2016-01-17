FactoryGirl.define do
  factory :message do
    sender_name "Miles"
    sender_email "miles@madebymiles.com"
    body "lorem ipsum doloar amid set"
    subject "this is my subject"
    read false
  end
end