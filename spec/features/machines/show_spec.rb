require 'rails_helper'

RSpec.describe 'As a user' do
  before :each do
    @snack_1 = Snack.create!(name: 'White Castle Burger', price: 3.50)
    @snack_2 = Snack.create!(name: 'Pop Rocks', price: 1.50)
    @snack_3 = Snack.create!(name: 'Flaming Hot Cheetos', price: 2.50)

    @owner_1 = Owner.create!(name: 'Coke')

    @machine_1 = @owner_1.machines.create!(location: 'Somewhere')
  end

  describe 'When I visit a vending machine show page' do
    it 'I see the name of all of the snacks associated with that vending machine along with their price' do
      visit machine_path(@snack_1, @snack_2, @snack_3)

      expect(page).to have_content('White Castle Burger: $3.50')
      expect(page).to have_content('Pop Rocks: $1.50')
      expect(page).to have_content('Flaming Hot Cheetos: $2.50')
    end
  end
end

# As a user
# When I visit a vending machine show page
# I see the name of all of the snacks associated with that vending machine along with their price
