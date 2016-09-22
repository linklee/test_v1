require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question, user: user, body: "sample text", title: "sample title") }
  let(:answer) { FactoryGirl.create(:answer, question: question, body: "sample text") }
  let!(:edit) { FactoryGirl.create(:edit, user: user, answer: answer) } 

  subject { answer }

  it { is_expected.to respond_to(:body) }
  it { is_expected.to respond_to(:old_body) }
  it { is_expected.to respond_to(:question) }

  it { is_expected.to have_many(:edits).dependent(:destroy) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to be_valid }

  it 'should have right question' do
    expect(answer.question).to eq(question) 
  end
  it 'returns pending edits' do
  	#where is_approved = nil
  	pending_edit = answer.pending_edits.first
  	#edit we created earlier is pending.
  	expect(pending_edit).to eq(edit)
  end

  it 'updates body and old_body' do
  	#save old body
  	old_text = answer.body
  	#update and reload
  	answer.update_body("new body")

  	answer.reload
  	#check new body 
  	expect(answer.body).to eq("new body")
  	#check old_body
  	expect(answer.old_body).to eq(old_text)
  end

  it 'returns current_accepted_edit' do
  	edit.is_current = true
	answer.edits << edit
  	current_accepted_edit = answer.current_accepted_edit
  	expect(current_accepted_edit).to eq(edit)
  end
end
