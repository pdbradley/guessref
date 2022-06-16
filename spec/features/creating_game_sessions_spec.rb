require 'rails_helper'

describe "User creates a game", type: :feature do

  it "creates a game and redirects to the game show page" do

    as_user('Phil') do
      visit root_path
      click_link 'New Game'
      fill_in 'game_name', with: 'Phil Game'
      click_button 'Create!'
    end
  end
end
