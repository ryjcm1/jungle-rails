require 'rails_helper'

RSpec.feature "Visitor navigates to product detail page", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They should see the number in cart number change from 0 to 1" do
    # ACT
    visit root_path

    
    first('.product').click_button('Add')
    
    # DEBUG / VERIFY
    save_screenshot

    expect(page).to have_content('My Cart (1)')

  end
end
