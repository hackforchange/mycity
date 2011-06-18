class Vote
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :issue
end
