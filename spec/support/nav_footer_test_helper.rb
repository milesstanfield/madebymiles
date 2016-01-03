module NavFooterTestHelper
  def clickable_logo_expectations(path)
    visit path
    within "nav" do
      find(".madebymiles_logo").click
    end
    expect(current_path).to eq path
  end

  def clickable_nav_tabs_expectations(path)
    visit path
    tab_texts.each do |tab_text|
      within "[data-name='nav-tabs']" do
        click_link tab_text
      end
      next_page_expectations tab_text
    end
  end

  def legal_copy_expectations(path)
    visit path
    within "footer" do
      expect(page).to have_text "This site was designed and MadeByMiles"
      expect(page).to have_text "© 2015 MadeByMiles.com"
    end
  end

  def hamburger_expectations(path)
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

  def footer_tab_texts
    tab_texts.unshift "home"
  end
end