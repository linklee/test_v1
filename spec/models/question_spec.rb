require 'spec_helper'
require "rails_helper" 
require 'shoulda-matchers'

describe Question do

  let(:user) { FactoryGirl.create(:user) }
  before { @question = user.questions.build(body: "Lorem ipsum")   }

  subject { @question }

  it { should respond_to(:body) }
  it { should respond_to(:title) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }


  it { should have_many(:answers).dependent(:destroy) }

  it { should be_valid }

  it 'should have user who created it' do
    expect(@question.user).to eq(user) 
  end


  #describe "accessible attributes" do
  #  it "should not allow access to user_id" do
  #    expect do
  #      Question.new(user_id: user.id)
  #    end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  #  end
  #end

  describe "when user_id is not present" do
   # before { @question.user_id = nil }
    #it { should_not be_valid }
  end
end
