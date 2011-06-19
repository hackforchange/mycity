class IssuesController < ApplicationController
  respond_to :html

  def index
    @issues = Issue.all
  end

  def create
    @issue = Issue.new(params[:issue])
    @issue.save
    respond_with @issue
  end

  def show
    @issue = Issue.find(params[:id])
  end

end
