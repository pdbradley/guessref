require 'rails_helper'

describe "welcome / root page", type: :feature do

  it "shows a list of active game sessions" do
    create(:game_session, name: 'GS Lobby', status: GameSession::LOBBY_STATUS)
    create(:game_session, name: 'GS Active', status: GameSession::ACTIVE_STATUS)
    create(:game_session, name: 'GS Completed', status: GameSession::COMPLETED_STATUS)

    visit root_path

    expect(page).to have_content 'GS Lobby'
    expect(page).to have_content 'GS Active'
    expect(page).not_to have_content 'GS Completed'
  end
end

