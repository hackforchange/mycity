class Issue
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :description

  validates_length_of :title, :in => 25..105, :allow_nil => false

  embeds_many :votes
end
