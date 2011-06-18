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
      render :json => {:errors => @issue.errors}, :status => 403
    end

    def show
      @issue = Issue.find(params[:id])

      if @issue
        render :json => @issue
      else
        render :json => "Not found", :status => 404
      end
    end
  end
end
