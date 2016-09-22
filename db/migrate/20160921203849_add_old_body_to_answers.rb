class AddOldBodyToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :old_body, :text
  end
end
