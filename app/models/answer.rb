class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :edits, dependent: :destroy
  #edits which have not been accepted and rejected yet have is_accepted = nil
  def pending_edits
  	self.edits.where(:is_approved => nil)
  end
  def updateBody (new_body)
  	update_attributes :old_body => self.body, :body => new_body
  end
end
