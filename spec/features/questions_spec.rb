require 'spec_helper'
require 'rails_helper'
puts $LOAD_PATH
require 'main_helper'

RSpec.describe "Questions", type: :request do
  MainHelper.auth
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
