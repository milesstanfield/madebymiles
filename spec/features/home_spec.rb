require "spec_helper"

describe "home page", type: :feature do
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
        expect(page).to have_text "DEVELOPER DESIGNER TEACHER When I'm not writing tests, refactoring, teaching, designing"
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
        expect(page).to have_text "more about me"
        find("a[href='/about']").click
      end
      expect(page).to have_text "Software Developer with a background in design, living/working in Atlanta, GA"
    end

    it "has a head img and caption" do
      within "[data-area='about']" do
        expect(page).to have_css ".about_head"
        expect(page).to have_text "Miles Stanfield"
      end
    end

    it "has an about summary text" do
      within "[data-area='about']" do
        expect(page).to have_text "about Miles Stanfield Everyday I'm immersed in code. I love it. And what's even better
          is I get paid to it. Currently, I'm the Data Manager for HLN - A Time Warner Company, in Atlanta, GA. One of my
          main responsibilities as Data Manager is continually improving and maintaining a product I developed called The
          HLN Social Index which is a proprietary trending algorithm that aggregates data from Facebook, Twitter and Google
          into a real-time all-screens experience. It's promoted on TV every weekday on HLN and it also won a 2016 CES
          Innovation Award. As the developer who built nearly all the front-end for the HLNtv.com site, I also find myself
          from time-to-time providing support on that project but my primary role is to continue innovating, designing
          and developing new products to better our company's brand. more about me"
      end
    end
  end

  context "blog area" do
    before do
      create_posts_and_tags "blog"
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
        expect(page).to have_text "more blog posts"
        find("a[href='/posts/blog']").click
      end
      expect(page).to have_text "Why you should use rails"
    end

    it "has (x) post cards" do
      expect(all_cards.count).to eq 6
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
      create_posts_and_tags "tutorial"
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
        expect(page).to have_text "more tutorials"
        find("a[href='/posts/tutorials']").click
      end
      expect(page).to have_text "Why you should use rails"
    end

    it "has (x) post cards" do
      expect(all_cards.count).to eq 6
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

  context "portfolio area" do
    before do
      FactoryGirl.create :portfolio, published: true
    end

    before :each do
      visit "/"
    end

    it "has a header" do
      within "[data-area='portfolios']" do
        expect(page).to have_text "portfolio"
        expect(page).to have_css ".cog_orange"
      end
    end

    it "more button" do
      within "[data-area='portfolios']" do
        expect(page).to have_text "more of my portfolio"
        find("a[href='/portfolios']").click
      end
      expect(page).to have_text "title of portfolio"
    end
  end

  def all_cards
    page.all("[data-area='card']")
  end
end
