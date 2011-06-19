class Vote
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :user
  validates_presence_of :issue

  field :user_id
  belongs_to :user

  field :issue_id
  belongs_to :issue
end
