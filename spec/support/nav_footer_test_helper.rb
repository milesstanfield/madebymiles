module NavFooterTestHelper
  def clickable_logo_expectations(path)
    visit path
    within "nav" do
      find(".madebymiles_logo").click
    end
    expect(current_path).to eq path
  end

  def clickable_nav_tabs_expectations(path)
    tab_expectations path, nav_tab_texts, "nav"
  end

  def clickable_all_tabs_expectations(path)
    tab_expectations path, footer_tab_texts, "footer"
  end

  def tab_expectations(path, tab_texts, type)
    visit path
    tab_texts.each do |tab_text|
      within "[data-name='#{type}-tabs']" do
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
    nav_tab_texts.each do |tab_text|
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
    elsif tab_text == "portfolio"
      expect(current_path).to eq "/portfolios"
    else
      expect(current_path).to eq "/#{tab_text}"
    end
  end

  def footer_tab_texts
    ["home", "about", "portfolio", "contact", "tutorials", "blog", "search"]
  end

  def nav_tab_texts
    ["about", "portfolio", "contact", "tutorials", "blog"]
  end
end