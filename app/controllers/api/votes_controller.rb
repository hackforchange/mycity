module Api
  class VotesController < ApplicationController
    before_filter :authenticate_user!, :only => :create

    def create
      @vote = current_user.vote!(Issue.find(params[:issue_id]))

      if @vote
        votes_count = Issue.find(params[:issue_id]).votes.count
        render :json => { issue_id: @vote.issue_id, votes_count: votes_count }
      else
        render :json => { errors: "already voted on that issue" }, status: 403
      end
    rescue ActiveRecord::StatementInvalid
      render :json => { errors: @vote.errors }
    end

  end
end
