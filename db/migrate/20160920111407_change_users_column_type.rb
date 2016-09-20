class ChangeUsersColumnType < ActiveRecord::Migration
  def change
  	remove_column :users, :name
    remove_column :users, :last_name
    add_column :users, :name, :string
    add_column :users, :last_name, :string
  end
end
