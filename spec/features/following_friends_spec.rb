require 'rails_helper'
RSpec.feature "Following Friends" do 
    before do 
       @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password") 
       @peter = User.create(first_name: "Peter", last_name: "Khans", email: "peter@example.com", password: "password") 
       login_as(@john)
    end
    
    scenario "if signed in succeeds" do 
        visit "/"
        expect(page).to have_content(@john.full_name)
        expect(page).to have_content(@peter.full_name)
        #Should not have the follow link on John... cuz you are yourself
        expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@john.id}")
       #Find the link to add peter as a friend
       link = "a[href='/friendships?friend_id=#{@peter.id}']"
       find(link).click
       #Once this has been clicked then the follow link for Peter should be missing
       expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@peter.id}")
    end
end