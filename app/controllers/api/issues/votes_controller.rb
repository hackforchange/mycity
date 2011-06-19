module Api
  module Issues
    class VotesController < ApplicationController
      before_filter :authenticate_user!, :only => :create

      def create
        @vote = Vote.new(params[:vote])

        if @vote.save
          render :json => @vote
        else
          render :json => {:errors => @vote.errors}, :status => 403
        end
      end
    end
  end
end
