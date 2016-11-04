require 'rails_helper'

RSpec.feature "Creating Exercice" do 
    before  do
        @john = User.create(email: 'john@example.com', password: 'password')
        login_as(@john)
        
    end
    
    scenario "with valid inputs" do
        visit '/'
        click_link "My Lounge"
        click_link "New Workout"
        expect(page).to have_link("Back")
        fill_in "Duration", with: 70
        fill_in "Workout Details", with: "Weight lifting"
        fill_in "Activity date", with: "2016-11-04"
        click_button "Create Exercice"
        expect(page).to have_content("Exercise has been created")
        
        exercice = Exercice.last
        expect(page.current_path).to eq(user_exercice_path(@john, exercice))
    end
end