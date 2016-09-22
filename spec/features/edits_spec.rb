require 'spec_helper'
require 'rails_helper'

RSpec.describe "Edits", type: :request do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:q) { FactoryGirl.create(:question, user: user) }
  let!(:answer) { FactoryGirl.create(:answer, user: user, question: q) }
  let!(:edit) { FactoryGirl.create(:edit, user: user2, answer: answer) } 

  before do 
    #login
    page.driver.post new_user_session_path, 'user[email]' => user.email, 'user[password]' => 'password123'
    #go to question page
    visit question_path(q) 
  end
  describe "GET questions/question_id'" do
    it "should create new edit when we submit new_edit form " do
      #check that answer has only one edit we created earlier
      expect(answer.edits.size).to eq(1)

      #should have link that shows new edit form
      expect(page).to have_css(".show-edit-#{answer.id}")

      #should have new edit form
      expect(page).to have_css("form.new_edit")

      #find this form
      f = page.find(".edit-for-answer-#{answer.id}")

      #fill it
      within f do
        find('textarea[name="edit[body]"]').set "edit body" 
        find('input[name="commit"]').click
      end
      #reload answer to see if edits count has changed
      answer.reload
      #check that new edit is created
      expect(answer.edits.size).to eq(2)
      #check for right message after creation
      expect(page).to have_css("#notice", text: "Правка успешно создана.")
    end

    it "should change answer when we submit accept edit form " do
      #expect page to have accept edit form
      expect(page).to have_css(".accept-edit-#{edit.id} > form")

      #find this form
      f = page.find(".accept-edit-#{edit.id} > form")
      #save answer text
      old_text = answer.body
      #fill it
      within f do
        find("input[name='new_body']").set "#{answer.body} #{edit.body}" 
        find('input[name="commit"]').click
      end
      #reload answer
      answer.reload

      #answer text should be changed
      expect(answer.body).to eq "#{old_text} #{edit.body}"
      #answer old text should be changed 
      expect(answer.old_body).to eq old_text
      
      #reload edit
      edit.reload
      #edit should have this two params true
      expect(edit.is_approved).to eq true
      expect(edit.is_current).to eq true
      #should have link that shows new edit form
      expect(page).to have_css(".show-edit-#{answer.id}")
    end
  #end of describe
  end
#end of rspec  
end
