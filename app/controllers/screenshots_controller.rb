class ScreenshotsController < ApplicationController
  def index
    @screenshots = Dir['tmp/capybara/*.png'].sort.reverse
  end
end
