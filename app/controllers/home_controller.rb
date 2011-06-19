class HomeController < ApplicationController

  def index
    @sort = params[:sort] || 'recent'
    @issues = Issue.recent if @sort == 'recent'
    @issues = Issue.popular if @sort == 'popular'
  end

end
