require 'rails_helper'

RSpec.feature "Signing user in" do
    
    before do
        @john = User.create(first_name: "John", last_name: "Doe",email: "john@example.com" , password: "password")
        @jim = User.create(first_name: "Jim", last_name:"Donnan", email: "jim@example.com" , password: "password")
    end
    
    scenario "With valid credentials" do
        visit '/'
        click_link "Sign in"
        fill_in "Email", with: @john.email
        fill_in "Password", with: @john.password
        click_button "Log in"
        expect(page).to have_content("Signed in successfully")
        expect(page).to have_content("Signed in as "+@john.email)
        
    end
end