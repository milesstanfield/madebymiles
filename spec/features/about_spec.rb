require "spec_helper"

describe "about page", type: :feature do
  it "has MadeByMiles | about title tag" do
    visit "/about"
    expect(page).to have_title "MadeByMiles | about"
  end

  context "splash area" do
    before :each do
      visit "/about"
    end

    it "has a profile head image" do
      within "[data-area='splash']" do
        expect(page).to have_css "img[src='/assets/large_profile_head.png']"
      end
    end

    it "has splash copy" do
      within "[data-area='splash']" do
        expect(page).to have_text "A Ruby-on-Rails Developer with a background in design, living/working in Atlanta, GA"
        expect(page).to have_text "Code review and refactoring in an agile environment is by far my favorite aspect of
          being a developer because I get to teach others how to improve their code and learn new ways to improve my own."
      end
    end
  end

  context "background area" do
    before :each do
      visit "/about"
    end

    it "has background copy" do
      within "[data-area='background']" do
        expect(page).to have_text "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum
          has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type
          and scrambled it to make a. It has survived not only five centuries, but also the leap into electronic typesetting,
          remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing"
      end
    end
  end

  context "education area" do
    before :each do
      visit "/about"
    end

    it "has school logo" do
      within "[data-area='education']" do
        expect(page).to have_css "img[src='/assets/u_of_a_logo.png']"
      end
    end

    it "has education copy" do
      within "[data-area='education']" do
        expect(page).to have_text "University of Alabama"
        expect(page).to have_text "Bachelor of Fine Arts (B.F.A.)"
        expect(page).to have_text "2009 Alumni"
      end
    end
  end

  context "testimonials area" do
    before :each do
      visit "/about"
    end

    it "has testimonials" do
      within "[data-area='testimonials']" do
        expect(page.all("[data-name='testimonial']").count).to eq 3
      end
    end

    it "has testimonial authors name, title and message" do
      within "[data-area='testimonials']" do
        within first("[data-name='testimonial']") do
          expect(page).to have_text "David Horslev"
          expect(page).to have_text "Executive Creative Director | HLN"
          expect(page).to have_text "I left my full-time job mid-2015 to focus on the thing that makes me happiest:
            helping people share their passions. Despite the fact that I was working on extracurricular projects
            during weekends and late at night, I always thought"
        end
      end
    end
  end


  context "skills area" do
    before :each do
      visit "/about"
    end

    it "has blurb copy" do
      within "[data-area='skills']" do
        expect(page).to have_text "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
          Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley"
      end
    end

    it "has bar skills" do
      within "[data-area='skills']" do
        expect(page.all("[data-name='bar']").count).to eq 8
        within first("[data-name='bar']") do
          expect(page).to have_text "HTML / HAML"
        end
      end
    end
  end


  context "work area" do
    before :each do
      visit "/about"
    end

    it "has work cards with title, company, years and description" do
      within "[data-area='work']" do
        expect(page.all("[data-name='work-card']").count).to eq 5
        within first("[data-name='work-card']") do
          expect(page).to have_text "Data Manager"
          expect(page).to have_text "HLNtv.com"
          expect(page).to have_text "2014 - 2016"
          expect(page).to have_text "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the"
        end
      end
    end
  end
end
