class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :edits, dependent: :destroy

end
