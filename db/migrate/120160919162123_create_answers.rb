class CreateAnswers < ActiveRecord::Migration
  def change
	#execute "DROP TABLE #{:answers} CASCADE" 

    create_table :answers do |t|
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
