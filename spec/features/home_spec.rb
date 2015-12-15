require "spec_helper.rb"

describe "home page", type: :feature do
  it "has a splash section" do
    visit "/"
    within "[data-name='splash']" do
      expect(page).to have_content("DEVELOPER")
      expect(page).to have_content("DESIGNER")
      expect(page).to have_content("TEACHER")
      expect(page).to have_content("Lorem Ipsum is simply dummy text of the printing and typesetting
        industry. Lorem Ipsum has been the industry's standard dummy text")
    end
  end

  it "has an about section" do
    visit "/"
    within "[data-name='about']" do
      expect(page).to have_content("about")
      expect(page).to have_css(".cog_orange")
      expect(page).to have_css(".profile_head")
      expect(page).to have_content("Lorem Ipsum is simply dummy text of the printing and typesetting industry.
        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown
        printer took a galley of type and scrambled it to make a. It has survived not only five centuries,
        but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised
        in the 1960s with the release of Letraset sheets containing")
      expect(page).to have_content("more")
      expect(page).to have_css("a[href='/about']")
    end
  end


  context "blog section" do
    before do
      @tag_names = ["rails", "rspec", "git", "heroku", "bash", "haml", "scss"]
      @tag_names.each_with_index do |tag_name, index|
        post = FactoryGirl.create(:post, title: "Why you should use #{tag_name}", use: "blog", created_at: Time.now - (index + 1).hours)
        post.tags.create(name: "#{tag_name}tag")
      end
    end
    before(:each) do
      visit "/"
    end
    it "has a header and more button" do
      within "[data-name='blog']" do
        expect(page).to have_content("blog")
        expect(page).to have_css(".cog_orange")
        expect(page).to have_content("more")
        expect(page).to have_css("a[href='/posts/blog']")
      end
    end
    it "has 6 cards with content in order by created_at" do
      within "[data-name='blog']" do
        cards = page.all("[data-name='card']")
        expect(cards.count).to eq 6

        @tag_names[0..5].each_with_index do |tag_name, index|
          within(cards[index]) do
            expect(page).to have_content("Why you should use #{tag_name}")
            expect(one_selector_exists?("a[href='/posts/#{slug_date_portion}/why-you-should-use-#{tag_name}']",
              "a[href='/posts/#{alternate_slug_date_portion}/why-you-should-use-#{tag_name}']")).to eq true
            expect(page).to have_css(".tag")
            expect(page).to have_content("#{tag_name}tag")
            expect(page).to have_css("a[href='/posts/tagged/#{tag_name}tag']")
            expect(page).to have_css(".arrow_dark_blue")
          end
        end

      end
    end
  end
end