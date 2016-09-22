require 'rails_helper'

RSpec.describe MainHelper do
    def create
      let!(:user) { FactoryGirl.create(:user) }
      let!(:q) { FactoryGirl.create(:question, user: user, body: "sample text", title: "sample title") }
      let!(:answer) { FactoryGirl.create(:answer, user: user, question: q) }
    end
end
