class PagesController < ApplicationController

  skip_before_action :authenticate!

  def home
  end

  def about
    @coders = %w(pdbradley dinushka.herath JCTalbott hope.bradley mehanyw)
  end
end
