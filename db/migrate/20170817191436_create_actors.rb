class CreateActors < ActiveRecord::Migration[5.1]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :gender
      t.string :bio
      t.date :born
      t.timestamps
    end
    add_index :actors, :name
    add_index :actors, :gender
    add_index :actors, :born
  end
end
