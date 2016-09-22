class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :edits, dependent: :destroy
  #edits which have not been accepted and rejected yet have is_approved = nil
  def pending_edits
  	self.edits.where(:is_approved => nil)
  end
  def update_body (new_body)
  	update_attributes :old_body => self.body, :body => new_body
  end
  def current_accepted_edit
  	edits.find_by(:is_current => true)
  end
end
