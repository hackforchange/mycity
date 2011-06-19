class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise *%w(

    database_authenticatable
    registerable
    recoverable
    rememberable
    trackable
    validatable
    token_authenticatable

  ).map(&:to_sym)

  has_many :votes

  index :email, :unique => true
  index :password

  before_create :ensure_authentication_token

end
