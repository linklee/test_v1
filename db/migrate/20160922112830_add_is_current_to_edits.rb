class AddIsCurrentToEdits < ActiveRecord::Migration
  def change
    add_column :edits, :is_current, :boolean

  end
end
