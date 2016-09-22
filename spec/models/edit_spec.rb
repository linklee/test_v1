require 'rails_helper'

RSpec.describe Edit, type: :model do
  let(:answer) { FactoryGirl.create(:answer) }
  let!(:edit) { FactoryGirl.create(:edit, answer: answer) } 
  subject { edit }

  it { is_expected.to respond_to(:body) }
  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:answer) }
  it { is_expected.to belong_to(:answer) }
  it "edit.accept should change attributes to true" do
  	
  	#check that attributes are nil
  	expect(edit.is_approved).not_to eq(true)
  	expect(edit.is_current).not_to eq(true)
  	
  	edit.accept
  	#check that attr are changed
  	expect(edit.is_approved).to eq(true)
  	expect(edit.is_current).to eq(true)

  end
end


