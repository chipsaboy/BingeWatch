class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
    	t.string :name
    	t.text :overview
    	t.string :poster
    	t.float :rating
      t.integer :num_episodes
      t.integer :num_seasons
      t.string :cast
    	t.string :created
      t.string :network
      t.string :genres
    	t.string :backdrop
      t.timestamps
    end
    add_index :shows, :name
    add_index :shows, :network
  end
end
