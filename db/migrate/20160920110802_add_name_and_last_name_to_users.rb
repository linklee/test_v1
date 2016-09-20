class AddNameAndLastNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :text
    add_column :users, :last_name, :text
  end
end
