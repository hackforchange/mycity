module Api
  class IssuesController < ApplicationController
    respond_to :json

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
