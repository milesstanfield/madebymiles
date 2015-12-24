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
      ["home", "about", "portfolio", "connect", "tutorials", "blog"].each do |tab_text|
        within "nav" do
          click_link tab_text
        end
        if tab_text == "tutorials" || tab_text == "blog"
          expect(current_path).to eq "/posts/#{tab_text}"
        elsif tab_text == "home"
          expect(current_path).to eq "/"
        else
          expect(current_path).to eq "/#{tab_text}"
        end
      end
    end
  end
end