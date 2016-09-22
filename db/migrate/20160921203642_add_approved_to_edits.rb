class AddApprovedToEdits < ActiveRecord::Migration
  def change
    add_column :edits, :is_approved, :boolean
  end
end
