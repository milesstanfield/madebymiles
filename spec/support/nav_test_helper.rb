module NavTestHelper
  def it_has_clickable_logo(path)
    it "has a clickable logo that directs to the root path" do
      visit path
      within "nav" do
        find(".madebymiles_logo").click
      end
      expect(current_path).to eq path
    end
  end

  def it_has_clickable_tags(path)
    it "has clickable tabs" do
      visit path
      tab_texts.each do |tab_text|
        within "[data-name='nav-tabs']" do
          click_link tab_text
        end
        next_page_expectations tab_text
      end
    end
  end

  def it_has_mobile_hamburger_functionality(path)
    it "has a clickable hamburger", js: true, driver: :selenium do
      visit path
      resize_window :mobile

      tab_texts.each do |tab_text|
        within "nav" do
          expect(page).not_to have_text "about"
          find(".hamburger").click
          click_link tab_text
        end
        next_page_expectations tab_text
      end
    end
  end

  def next_page_expectations(tab_text)
    if tab_text == "tutorials" || tab_text == "blog"
      expect(current_path).to eq "/posts/#{tab_text}"
    elsif tab_text == "home"
      expect(current_path).to eq "/"
    else
      expect(current_path).to eq "/#{tab_text}"
    end
  end

  def tab_texts
    ["about", "portfolio", "connect", "tutorials", "blog"]
  end
end