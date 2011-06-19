class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :votes

  before_save :ensure_authentication_token

  def votes_on(issue)
    Vote
      .where { |vote| vote.issue_id == issue.id }
      .where { |vote| vote.user_id == self.id }
  end

  def voted_on?(issue)
    votes_on(issue).exists?
  end

  def vote!(issue)
    issue = Issue.find(issue) unless issue.is_a? Issue

    votes_on(issue).create unless voted_on?(issue)
  end
end
