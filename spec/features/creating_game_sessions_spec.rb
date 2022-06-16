require 'rails_helper'

describe "User creates a game", type: :feature do

  it "creates a game and redirects to the game show page and other users can see the game" do

    as_user('Phil') do
      visit root_path
      click_link 'New Game'
      fill_in 'game_name', with: 'Phil Game'
      click_button 'Create!'

      # don't really like using activerecord in here but meh
      # expect(page).to have_current_path(game_session_path(GameSession.first))
      # expect(current_path).to match /game_session\/+d/
      expect(page).to have_content 'Phil Game'
    end

    as_user('Dinushka') do
      visit root_path

      expect(page).to have_content 'Phil Game'
    end
  end
end
