class AddAuthTokenToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :authentication_token, :string
    add_index  :users, :authentication_token, :unique => true
  end

  def self.down
  end
end
