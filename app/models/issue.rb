class Issue
  include Mongoid::Document
  include Mongoid::Timestamps

  def self.recent
    all.desc(:created_at)
  end

  def self.popular

  end

  field :title
  field :description

  validates_length_of :title, :in => 5..105, :allow_nil => false

  has_many :votes
end
