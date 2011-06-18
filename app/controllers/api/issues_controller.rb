module Api
  class IssuesController < ApplicationController
    def new
      @issue = Issue.new
    end

    def create
      @issue = Issue.new(params[:issue])

      if @issue.save
        redirect_to :show
      else
        render :action => :new
      end
    end
  end
end
