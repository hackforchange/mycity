class AddVotes < ActiveRecord::Migration
  def self.up
    create_table(:votes) do |t|
      t.timestamps
      t.integer :user_id
      t.integer :issue_id
    end
  end

  def self.down
    drop_table :votes
  end
end
