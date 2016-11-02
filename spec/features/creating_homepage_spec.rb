
require "rails_helper"
RSpec.feature "Creating Homepage" do
    
    scenario "User visits the front page" do
        visit '/'
        expect(page).to have_content("Workout Lounge")
        expect(page).to have_link("Athletes Den")
        expect(page).to have_link("Home")
    end
    
end
