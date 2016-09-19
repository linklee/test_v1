require 'spec_helper'
require 'rails_helper'

RSpec.describe "Questions", type: :request do
  let(:user) { FactoryGirl.create(:user) }
  let!(:q1) { FactoryGirl.create(:question, user: user, body: "sample text", title: "sample title") }
  let!(:q2) { FactoryGirl.create(:question, user: user, body: "sample text2", title: "sample title2") }

  before { visit question_path(q1) }
  describe "GET /questions/question_id" do
    it "should have question title" do
      title = page.find(".q-title")
      expect(title).to have_content(q1.title)
      expect(page).to have_http_status(200)
    end
    it "should have question body" do
      body = page.find(".q-body") 
      expect(body).to have_content(q1.body)
    end
    it "should have user" do
      user_name = page.find(".q-user")
      expect(user_name).to have_content("#{user.name} #{user.last_name}")
    end
  end
end
