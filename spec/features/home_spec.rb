require "spec_helper"

describe "home page", type: :feature do
  it "has MadeByMiles title tag" do
    visit "/"
    expect(page).to have_title "MadeByMiles"
  end

  it "has a connect zone" do
    visit "/"
    connect_expectations
  end

  context "splash area" do
    before :each do
      visit "/"
    end
    it "has large splash text" do
      within "[data-area='splash']" do
        expect(page).to have_text "DEVELOPER"
        expect(page).to have_text "DESIGNER"
        expect(page).to have_text "TEACHER"
      end
    end

    it "has short splash info text" do
      within "[data-area='splash']" do
        expect(page).to have_text "Lorem Ipsum is simply dummy text of the printing and typesetting
          industry. Lorem Ipsum has been the industry's standard dummy text"
      end
    end
  end

  context "about area" do
    before :each do
      visit "/"
    end
    it "has an about header and more button" do
      within "[data-area='about']" do
        expect(page).to have_text "about"
        expect(page).to have_css ".cog_orange"
        expect(page).to have_text "more"
        expect(page).to have_css "a[href='/about']"
      end
    end
    it "has a head img and caption" do
      within "[data-area='about']" do
        expect(page).to have_css ".about_head"
        expect(page).to have_text "Miles Stanfield"
      end
    end
    it "has an about summary text" do
      within "[data-area='about']" do
        expect(page).to have_text "Lorem Ipsum is simply dummy text of the printing and typesetting industry.
          Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown
          printer took a galley of type and scrambled it to make a. It has survived not only five centuries,
          but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised
          in the 1960s with the release of Letraset sheets containing"
      end
    end
  end

  context "blog area" do
    let(:tag_names) { ["rails", "rspec", "git", "heroku", "bash", "haml", "scss"] }
    before do
      tag_names.each_with_index do |tag_name, index|
        post = FactoryGirl.create(:post, title: "Why you should use #{tag_name}", use: "blog",
          created_at: Time.now - (index + 1).hours)
        post.tags.create(name: "#{tag_name}tag")
      end
    end
    before :each do
      visit "/"
    end
    it "has a header and more button" do
      within "[data-area='blog']" do
        expect(page).to have_text "blog"
        expect(page).to have_css ".cog_orange"
        expect(page).to have_text "more"
        expect(page).to have_css "a[href='/posts/blog']"
      end
    end
    it "has 4 cards with content in order by created_at" do
      within "[data-area='blog']" do
        cards = page.all("[data-area='card']")
        expect(cards.count).to eq 4
        tag_names[0..3].each_with_index do |tag_name, index|
          within(cards[index]) do
            expect(page).to have_text "Why you should use #{tag_name}"
            expect(one_selector_exists?( card_post_link(slug_date_portion1, tag_name), card_post_link(slug_date_portion2, tag_name),
              card_post_link(slug_date_portion3, tag_name) )).to eq true
            expect(page).to have_css ".tag"
            expect(page).to have_text "#{tag_name}tag"
            expect(page).to have_css "a[href='/posts/tagged/#{tag_name}tag']"
            expect(page).to have_css ".arrow_dark_blue"
          end
        end
      end
    end
    def card_post_link(date, tag_name)
      "a[href='/posts/#{date}/why-you-should-use-#{tag_name}']"
    end
  end


  context "tutorial area" do
    let(:tag_names) { ["coffeescript", "capybara", "dns", "caching", "routes", "tasks", "css"] }
    before do
      tag_names.each_with_index do |tag_name, index|
        post = FactoryGirl.create(:post, title: "Why you should use #{tag_name}", use: "tutorial",
          created_at: Time.now - (index + 1).hours)
        post.tags.create(name: "#{tag_name}tag")
      end
    end
    before(:each) do
      visit "/"
    end
    it "has a header and more button" do
      within "[data-area='tutorials']" do
        expect(page).to have_text "tutorials"
        expect(page).to have_css ".cog_orange"
        expect(page).to have_text "more"
        expect(page).to have_css "a[href='/posts/tutorials']"
      end
    end
    it "has 4 cards with content in order by created_at" do
      within "[data-area='tutorials']" do
        cards = page.all("[data-area='card']")
        expect(cards.count).to eq 4
        tag_names[0..3].each_with_index do |tag_name, index|
          within(cards[index]) do
            expect(page).to have_text "Why you should use #{tag_name}"
            expect(one_selector_exists?( card_post_link(slug_date_portion1, tag_name), card_post_link(slug_date_portion2, tag_name),
              card_post_link(slug_date_portion3, tag_name) )).to eq true
            expect(page).to have_css ".tag"
            expect(page).to have_text "#{tag_name}tag"
            expect(page).to have_css "a[href='/posts/tagged/#{tag_name}tag']"
            expect(page).to have_css ".arrow_dark_blue"
          end
        end
      end
    end
    def card_post_link(date, tag_name)
      "a[href='/posts/#{date}/why-you-should-use-#{tag_name}']"
    end
  end

end
