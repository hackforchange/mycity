class IssuesController < ApplicationController
  respond_to :html

  def index
    @issues = Issue.popular
  end

  def create
    raise "LOLWTF"
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
