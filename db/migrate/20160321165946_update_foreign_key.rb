class UpdateForeignKey < ActiveRecord::Migration
  def change
    # remove the old foreign_key
    #remove_foreign_key :answers, :users

    # add the new foreign_key
#    add_foreign_key :answers, :users, on_delete: :cascade
     # remove the old foreign_key
    #remove_foreign_key :answers, :questions

    # add the new foreign_key
    #add_foreign_key :answers, :questions, on_delete: :cascade

     # remove the old foreign_key
    #remove_foreign_key :edits, :answers

    # add the new foreign_key
    #add_foreign_key :edits, :answers, on_delete: :cascade
  end
end
