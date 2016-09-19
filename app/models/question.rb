class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :edits, dependent: :destroy

end
