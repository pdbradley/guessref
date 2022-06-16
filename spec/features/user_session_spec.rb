require 'rails_helper'

describe "the signin process", type: :feature do

  it "signs me in and shows my name at the top" do
    # helper
    sign_in_as(name: 'Phil')

    expect(page).to have_content 'Welcome Phil'
  end
end
