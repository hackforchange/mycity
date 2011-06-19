module Api
  class VotesController < ApplicationController
    before_filter :authenticate_user!, :only => :create

    def create
      @vote = current_user.vote!(Issue.find(params[:issue_id]))

      if @vote
        vote_count = Issue.find(params[:issue_id]).votes.count
        render :json => { issue_id: @vote.issue_id, vote_count: vote_count }
      else
        render :json => { errors: @vote.errors }, status: 403
      end
    end
  end
end
