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
    
    it "should create new answer when submit new answer form " do
      #no answers
      expect(q.answers.size).to eq(0)
      #we have new answer form it is hidden but we can submit it anyway
      expect(page).to have_css("form.new_answer")
      
      f = page.find("form.new_answer")
      #fill the form
      within f do
        find('textarea[name="answer[body]"]').set "Answer body" 
        find('input[name="commit"]').click
      end
      #reload our question to see if answers count changed
      q.reload
      #check that new answer is created
      expect(q.answers.size).to eq(1)
      #check for right message after creation
      expect(page).to have_css("#notice", text: "Вопрос успешно создан.")
    end
    
    it "New answer link should have text 'Дать ответ' when there are no answers to question" do
      expect(page).to have_css(".show-answer-link", text: "Дать ответ")
    end

    it "New answer link should have text 'Дать новый ответ' when there are answers to question" do
      FactoryGirl.create(:answer, user: user, body: "sample text", question: q)
      visit question_path(q)    
      expect(page).to have_css(".show-answer-link", text: "Дать новый ответ")
    end
  end
end
