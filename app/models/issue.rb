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
  field :tag

  validates_length_of :title, :in => 5..105, :allow_nil => false

  def as_json(opts={})
    super.merge(
      :votes_count => self.votes.count
    )
  end

  has_many :votes

  index :title
  index :tag

end
