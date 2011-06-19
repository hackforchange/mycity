class AddUser < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :email, :null => false
      t.string :database_authenticatable, :null => false
      t.string :recoverable
      t.string :rememberable
      t.string :trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      t.string :token_authenticatable
      t.string :reset_password_token
      t.string :authentication_token

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    add_index :users, :authentication_token, :unique => true
  end

  def self.down
    drop_table :users
  end
end
