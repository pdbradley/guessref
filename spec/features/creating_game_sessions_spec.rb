require 'rails_helper'

describe "User creates a game", type: :feature do

  it "creates a game and redirects to the game show page and other users can see the game" do

    as_user('Phil') do
      visit root_path
      click_link "New Game"
      fill_in 'game_name', with: 'Phil Game'
      click_button 'create-session'

      expect(page).to have_content 'Phil Game'
    end

    as_user('Dinushka') do
      visit root_path

      expect(page).to have_content 'Phil Game'
    end
  end
end
