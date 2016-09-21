require 'spec_helper'
require 'rails_helper'

RSpec.describe "Answers", type: :request do
  let(:user) { FactoryGirl.create(:user) }
  let!(:q) { FactoryGirl.create(:question, user: user, body: "sample text", title: "sample title") }

  before do 
    #login
    page.driver.post new_user_session_path, 'user[email]' => user.email, 'user[password]' => 'password123'
    #go to question page
    visit question_path(q) 
  end
  describe "GET question/question_id'" do
    it "should see text_field for new question after clicking on answer link" do
      #find our link that removes class hidden from form
      a = page.find(".show-answer-link")
      #check if form still hidden
      expect(page).to have_css(".new-answer-form.hidden"), "#{page.body}"
      #click on link
      a.click
      #check that form is not hidden
      expect(page).not_to have_css(".new-answer-form.hidden"), "#{page.body}"
    end
    it "should create new answer when submit new answer form " do
      expect(q.answers.size).to eq(0)
      #a = page.find(".show-answer-link")
      f = page.find("form.new_answer")
      #a.click
      within f do
        find('textarea[name="answer[body]"]').set "Answer body" 
        find('input[name="commit"]').click
      end
      q.reload
      #check that new answer is created
      expect(q.answers.size).to eq(1)
    end
    it "New answer link should have text 'Дать ответ' when there are no answers to question" do
      expect(page).to have_css(".show-answer-link", text: "Дать ответ")
    end

    it "New answer link should have text 'Дать новый ответ' when there are answers to question" do
      FactoryGirl.create(:answer, user: user, body: "sample text", question: q)
      visit question_path(q)    
      expect(page).to have_css(".show-answer-link", text: "Дать новый ответ"), "#{q.answers.size}"
    end
  end
end
