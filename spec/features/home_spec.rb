require "spec_helper"

describe "home page", type: :feature do

  it "has MadeByMiles title tag" do
    visit "/"
    expect(page).to have_title "MadeByMiles"
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
        expect(page).to have_text "When I'm not writing tests, refactoring code, teaching Ruby on Rails
          or building websites ... I'm dreaming up ways to change the world through code."
      end
    end
  end

  context "about area" do
    before :each do
      visit "/"
    end

    it "has a header" do
      within "[data-area='about']" do
        expect(page).to have_text "about"
        expect(page).to have_css ".cog_orange"
      end
    end

    it "more button" do
      within "[data-area='about']" do
        expect(page).to have_text "more"
        find("a[href='/about']").click
      end
      expect(page).to have_text "A Ruby-on-Rails Developer with a background in design, living/working in Atlanta, GA"
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
    before do
      create_posts_and_tags("blog")
    end

    before :each do
      visit "/"
    end

    it "has a header" do
      within "[data-area='blog']" do
        expect(page).to have_text "blog"
        expect(page).to have_css ".cog_orange"
      end
    end

    it "more button" do
      within "[data-area='blog']" do
        expect(page).to have_text "more"
        find("a[href='/posts/blog']").click
      end
      expect(page).to have_text "Why you should use rails"
    end

    it "has (x) post cards" do
      expect(all_cards.count).to eq 4
    end

    it "orders cards by created_at" do
      all_cards.size.times do |index|
        within all_cards[index] do
          expect(page).to have_text "tease for post about #{tags[index]}"
        end
      end
    end

    it "has tags/links for posts" do
      within all_cards[0] do
        click_link "railstag"
      end
      expect(page).to have_text "Why you should use rails"
    end

    it "has a goto icon/link/button" do
      within all_cards[0] do
        within "[data-area='circle-button']" do
          expect(page).to have_css ".arrow_dark_blue"
          first("a").click
        end
      end
      expect(page).to have_text "Why you should use rails"
    end
  end

  context "tutorial area" do
    before do
      create_posts_and_tags("tutorial")
    end

    before :each do
      visit "/"
    end

    it "has a header" do
      within "[data-area='tutorials']" do
        expect(page).to have_text "tutorials"
        expect(page).to have_css ".cog_orange"
      end
    end

    it "more button" do
      within "[data-area='tutorials']" do
        expect(page).to have_text "more"
        find("a[href='/posts/tutorials']").click
      end
      expect(page).to have_text "Why you should use rails"
    end

    it "has (x) post cards" do
      expect(all_cards.count).to eq 4
    end

    it "orders cards by created_at" do
      all_cards.size.times do |index|
        within all_cards[index] do
          expect(page).to have_text "tease for post about #{tags[index]}"
        end
      end
    end

    it "has tags/links for posts" do
      within all_cards[0] do
        click_link "railstag"
      end
      expect(page).to have_text "Why you should use rails"
    end

    it "has a goto icon/link/button" do
      within all_cards[0] do
        within "[data-area='circle-button']" do
          expect(page).to have_css ".arrow_dark_blue"
          first("a").click
        end
      end
      expect(page).to have_text "Why you should use rails"
    end
  end

  def all_cards
    page.all("[data-area='card']")
  end
end
