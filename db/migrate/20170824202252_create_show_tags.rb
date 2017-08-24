class CreateShowTags < ActiveRecord::Migration[5.1]
  def change
    create_table :show_tags do |t|
      t.belongs_to :show, index: true, foreign_key: true
      t.belongs_to :tag, index: true, foreign_key: true
      t.timestamps null: false
      t.timestamps
    end
  end
end
