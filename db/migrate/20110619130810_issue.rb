class Issue < ActiveRecord::Migration
  def self.up
    create_table(:issues) do |t|
      t.string :title
      t.text :description
      t.string :tag
      t.string :longitude
      t.string :latitude
      t.timestamps

      t.integer :votes_count
    end

    add_index :issues, :tag
    add_index :issues, :longitude
    add_index :issues, :latitude
  end

  def self.down
    drop_table :issues
  end
end
