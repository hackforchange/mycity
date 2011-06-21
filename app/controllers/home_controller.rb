class HomeController < ApplicationController

  def index
    @issues = Issue.recent.limit 50
  end

end
