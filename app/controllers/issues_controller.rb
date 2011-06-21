class IssuesController < ApplicationController
  respond_to :html

  def index
    @sort = params[:sort] || 'recent'
    @issues = Issue.recent.limit 50 if @sort == 'recent'
    @issues = Issue.popular.limit 50 if @sort == 'popular'
    render :layout => false
  end

  def create
    @issue = Issue.new(params[:issue])
    if @issue.save
      respond_with @issue
      current_user.vote!(@issue) if current_user
    else
      render :text => 'Error'
    end
  end

  def show
    if @issue = Issue.find(params[:id])
      render :layout => false
    else
      render :text => 'Not Found', :status => 404
    end
  end

end
