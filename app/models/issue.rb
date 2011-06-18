class Issue
  include Mongoid::Document
  include Mongoid::Timestamps

  field :text

  embeds_many :votes
end
