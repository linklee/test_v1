class Edit < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  def approve
	update_attribute(:is_approved, true)
  end

end
