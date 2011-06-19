class Vote < ActiveRecord::Base
  validates_presence_of :user
  validates_presence_of :issue

  belongs_to :user
  belongs_to :issue
end
