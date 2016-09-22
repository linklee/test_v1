require 'spec_helper'
require 'rails_helper'

RSpec.describe "Edits", type: :request do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:q) { FactoryGirl.create(:question, user: user) }
  let!(:answer) { FactoryGirl.create(:answer, user: user, question: q) }

  before do 
    #login
    page.driver.post new_user_session_path, 'user[email]' => user.email, 'user[password]' => 'password123'
    #go to question page
    visit question_path(q) 
  end
  describe "GET questions/question_id'" do
   
    it "should see hidden text_field for new edit after clicking on new edit link" do
      #find our link that removes class hidden from form
     
      #a = page.find(".show-edit-link")
      #check if form still hidden
      #expect(page).to have_css(".edit-for-answer-#{answer.id}.hidden")
      #click on link
      #a.click
      #check that form is not hidden
       #puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!---------_!!!!!!!!!!!!!!!!!!"

      #puts page.body
      #        puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!---------_!!!!!!!!!!!!!!!!!!"
      #expect(page).not_to have_css(".new-edit-form.hidden")
    end

    it "should create new edit when we submit new_edit form " do

      expect(page).to have_css(".show-edit-#{answer.id}")

      #page.find(".show-edit-#{answer.id}").click
      
      expect(page).to have_css("form.new_edit")

      f = page.find(".edit-for-answer-#{answer.id}")
      within f do
        find('textarea[name="edit[body]"]').set "edit body" 
        find('input[name="commit"]').click
      end
      answer.reload
      #check that new answer is created
      expect(answer.edits.size).to eq(1)
      #check for right message after creation
      expect(page).to have_css("#notice", text: "Правка успешно создана.")
      
    end
    it "New answer link should have text 'Дать ответ' when there are no answers to question" do
      #expect(page).to have_css(".show-answer-link", text: "Дать ответ")
    end

  end
end
