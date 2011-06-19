class HomeController < ApplicationController

  def index
    @issues = Issue.recent
  end

end
