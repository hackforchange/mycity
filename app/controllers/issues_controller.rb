class IssuesController < ApplicationController
  respond_to :html

  def index
    @sort = params[:sort] || 'recent'
    @issues = Issue.recent if @sort == 'recent'
    @issues = Issue.popular if @sort == 'popular'
    render :layout => false
  end

  def create
    @issue = Issue.new(params[:issue])
    if @issue.save
      respond_with @issue
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
