module Api
  class VotesController < ApplicationController
    before_filter :authenticate_user!, :only => :create

    def create
      @vote = current_user.votes.new(issue_id: params[:issue_id])

      if @vote.save
        render :json => @vote
      else
        render :json => {:errors => @vote.errors}, :status => 403
      end
    end
  end
end
