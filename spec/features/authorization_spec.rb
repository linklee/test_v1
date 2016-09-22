require 'spec_helper'
require 'rails_helper'
require 'devise'

RSpec.describe "Authorization", type: :request do
let!(:user) { FactoryGirl.create(:user) }
let!(:q) { FactoryGirl.create(:question, user: user, body: "sample text", title: "sample title") }
let!(:answer) { FactoryGirl.create(:answer, user: user, question: q) }

  context "when not signed in" do
    describe "GET 'questions/new'" do
      before { visit new_question_path}
      it "should show sign_in form" do
        #so we just check for sign_in form with id #new_user
      	expect(page).to have_css('form#new_user')
      end
    end

    describe "GET 'questions/question_id'" do
      before { visit question_path q }
      it "shouldn't have new answer block" do
        #no link that shows new answer form
        expect(page).not_to have_css('.show-answer-link')
        #no new answer form
      	expect(page).not_to have_css('.new-answer-form')
      end
      it "shouldn't have new edit block" do
        #no show edit link
        expect(page).not_to have_css('.show-edit-link')
        #no new edit form
        expect(page).not_to have_css('new-edit-form')
      end
    end
  end

  context "when signed in" do
    before do
      @user ||= FactoryGirl.create :user
      page.driver.post new_user_session_path, 'user[email]' => @user.email, 'user[password]' => 'password123'
	    visit new_question_path
    end

    describe "GET 'questions/new'" do
      it "shows new question form" do
	      expect(page).to have_css('form#new_question'), "#{page.body}"
      end
    end

    describe "GET 'questions/question_id'" do
      before { visit question_path q }
      it "should have new answer block" do
        #has link that shows new answer form
        expect(page).to have_css('.show-answer-link')
        #has new answer form
        expect(page).to have_css('.new-answer-form'), "#{page.body}"
      end
      it "should have new edit block" do
        #has show edit link
        expect(page).to have_css('.show-edit-link')
        #has new edit form
        expect(page).to have_css('.new-edit-form')
      end
    end
  end


end
