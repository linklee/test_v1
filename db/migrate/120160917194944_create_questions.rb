class CreateQuestions < ActiveRecord::Migration
  def change
	#execute "DROP TABLE #{:questions} CASCADE" 
	create_table :questions do |t|
      t.string :title
      t.text :body
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
