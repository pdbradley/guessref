require 'rails_helper'

describe "the signin process", type: :feature do

  it "signs me in" do
    visit sign_in_path
    within("#session") do
      fill_in 'name', with: 'Billy'
    end

    click_button 'Go!'

    expect(page).to have_content 'Welcome Billy'
  end
end
