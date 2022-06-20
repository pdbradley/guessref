require 'rails_helper'
include ActionView::RecordIdentifier  # dom_id

describe "User creates a game", type: :feature do

  it "creates a game and then another use can join it" do

    as_user('Phil') do
      visit root_path
      click_link 'New Game'
      fill_in 'game_name', with: 'Phil Game'
      click_button 'Create!'
    end

    as_user('Dinushka') do
      visit root_path
      expect(page).to have_content 'Phil Game'
      click_link 'Phil Game'

      within('#game-session-staging') do
        click_button 'Join'
      end

      within('#game-session-show') do
        expect(page).to have_content 'Phil Game'
      end

    end
  end
end
