require 'spec_helper'
require "rails_helper" 
require 'shoulda-matchers'

describe Question do

  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question, user: user, body: "sample text", title: "sample title") }

  subject { question }

  it { is_expected.to respond_to(:body) }
  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:user_id) }
  it { is_expected.to respond_to(:user) }

  it { is_expected.to have_many(:answers).dependent(:destroy) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to be_valid }

  it 'should have user who created it' do
    expect(question.user).to eq(user) 
  end

end
