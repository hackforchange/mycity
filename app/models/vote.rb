class Vote
  include Mongoid::Document
  include Mongoid::Timestamps


  field :user_id
  belongs_to :user

  field :issue_id
  belongs_to :issue
end
