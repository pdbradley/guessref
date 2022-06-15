require 'rails_helper'

describe "the signin process", type: :feature do

  it "signs me in" do
    visit sign_in_path
    within("#session") do
      fill_in 'name', with: 'Billy'
    end

    # debugger

    # page.driver.debug(binding)
    # screenshot_and_open_image
    screenshot_and_save_page

    page.driver.render_base64
    click_button 'Go!'

    expect(page).to have_content 'Welcome Billyooo'
  end
end
