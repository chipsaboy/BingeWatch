class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
    	t.string :title
    	t.text :description
    	t.string :network
    	t.integer :series
    	t.string :created
    	t.string :image
      t.timestamps
    end
    add_index :shows, :title
    add_index :shows, :network
  end
end
