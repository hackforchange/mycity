module Api
  class IssuesController < ApplicationController
    respond_to :json

    def index
      @issues = Issue.all
      render :json => @issues
    end

    def create
      @issue = Issue.new(params[:issue])

      @issue.save
      render :json => @issue
    end

    def show
      @issue = Issue.find(params[:id])
      render :json => @issue
    end
  end
end
