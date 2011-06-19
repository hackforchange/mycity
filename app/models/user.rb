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

  ).map &:to_sym
end
