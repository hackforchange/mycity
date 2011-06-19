class Issue
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :description

  validates_length_of :title, :in => 5..105, :allow_nil => false

  has_many :votes
end
