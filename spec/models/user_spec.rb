require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }

  subject { user }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:last_name) }

  it { is_expected.to have_many(:edits).dependent(:destroy) }
  it { is_expected.to have_many(:answers).dependent(:destroy) }
  it { is_expected.to have_many(:questions).dependent(:destroy) }

end
