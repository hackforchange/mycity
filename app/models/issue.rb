class Issue
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :description
  field :tag
  field :longitude
  field :latitude

  validates_length_of :title, :in => 5..105, :allow_nil => false

  has_many :votes

  index :title
  index :tag

  def as_json(opts={})
    super.merge(
      :votes_count => self.votes.count
    )
  end

  def self.recent
    all.desc(:created_at)
  end

  def self.popular
    Vote.only(:issue_id).aggregate.collect do |v|
      i = Issue.find(v['issue_id'])
      {
        id: i.id,
        title: i.title,
        description: i.description,
        tag: i.tag,
        vote_count: v['count']
      }
    end
  end

  def self.maintenence
    tag(:maintenence)
  end

  def self.transportation
    tag(:transportation)
  end

  def self.other
    tag(:other)
  end

  def self.tag(tag)
    where(tag: tag.to_str)
  end

end
