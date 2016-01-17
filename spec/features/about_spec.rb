require "spec_helper"

describe "about page", type: :feature do
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

    it "has background copy and link" do
      within "[data-area='background']" do
        expect(page).to have_link "Vizrt"
        expect(page).to have_text "I started out as a painter, not a great one but with a fine arts degree I learned good
          design principles. That helped me get a job right as a graphic designer working at CNN International and then
          subsequently working at HLN. Years later I was immersed in specialized 3d animating software called Vizrt which
          happened to require a lot of programming knowledge to make the most of it. From that point on, I was all developer.
          I quickly gravitated towards front-end development because of my strong design background. Needless to say,
          CSS became my life. I started aimlessly developing PHP and Flash websites for work without any framework or
          guidance and then I got solid, on-the-job Ruby on Rails training everyday from a veteren programmer. Years later,
          I'm definitely one of those developers preaching convention over configuration and saying did you write a test for that?"
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
        expect(page).to have_text "skills I've had the opportunity to work with many languages and technologies in
          my career. Here are the ones that I use on a regular basis and also how strong & knowledgable I am at each of
          them. HTML / HAML Ruby on Rails Javascript & jQuery Rspec & Capybara TDD Coffeescript CSS / SASS Photoshop &
          Illustrator Swift / Xcode Postgresql / ActiveRecord"
      end
    end

    it "has bar skills" do
      within "[data-area='skills']" do
        expect(page.all("[data-name='bar']").count).to eq 9
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
          expect(page).to have_text "HLNtv.com 2014 - 2016 HLNtv.com 2014 - 2016 Data Manager Developed HLN’s
            award-winning social media trending algorithm The HLN Social Index Developed nearly all front-end code
            for the company’s website HLNtv.com Developed a web-based mobile application/game namethistweet.com
            Developed an API to feed data and control multiple Art Installations on the CNN tour in Atlanta, GA
            HLN's data-driven art installations Taught Rails conventions and industry standard development practices,
            especially TDD Agile work environment with code review, retrospectives, backlog and prioritization sessions"
        end
      end
    end
  end
end
