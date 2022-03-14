require 'rails_helper'

RSpec.feature "Visitor navigates to product detail page", type: :feature, js: true do
  before :each do
    #create user
    @user = User.create!(
      first_name: "Bon",
      last_name: "Jovi",
      email: "livingonaprayer@frank.com",
      password: "ididitmyway",
      password_confirmation: "ididitmyway"
    )
  end

  
  scenario "They be redirected to the homepage after successfully logining in" do
    visit '/login'

    
    fill_in 'email', with: @user.email

    fill_in 'password', with: @user.password

    click_button 'Submit'

    expect(page).to have_content('Logout')
    
    # save_screenshot

  end

  
end
