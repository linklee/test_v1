class CreateEdits < ActiveRecord::Migration
  def change
    create_table :edits do |t|
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.references :comment, index: true, foreign_key: true
      t.boolean :is_accepted

      t.timestamps null: false
    end
  end
end
