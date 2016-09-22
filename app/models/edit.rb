class Edit < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  def accept
  	#find current approved edit which affected answer text
  	current_edit = answer.edits.find_by(:is_current => true)
  	#set is_current attr to false if current edit is not nil
  	current_edit.update_attribute(:is_current, false) if current_edit
  	# accepted edit - set is approved and current attr to true 
	  update_attributes :is_approved => true, :is_current => true
  end

end
