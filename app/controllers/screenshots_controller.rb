class ScreenshotsController < ApplicationController

  skip_before_action :authenticate!

  def index
    @screenshots = Dir['tmp/capybara/*.png'].sort.reverse
  end
end
