module FooterTestHelper
  def it_has_legal_copy(path)
    it "has legal copy" do
      visit path
      within "footer" do
        expect(page).to have_text "This site was designed and MadeByMiles"
        expect(page).to have_text "© 2015 MadeByMiles.com"
      end
    end
  end
end