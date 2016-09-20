require 'spec_helper'
require 'rails_helper'
require 'devise'

RSpec.describe "Authorization", type: :request do

  context "when not signed in" do
    describe "GET 'questions/new'" do
      before { visit new_question_path}
      it "should show sign_in form" do
        #get new_question_path

      	#This is not working:
        #page.should be_redirect, "#{page.body}"
        #so we just check for sign_in form with id #new_user
      	expect(page).to have_css('form#new_user')
      end
    end
  end
  context "when signed in" do
    before do
      @user ||= FactoryGirl.create :user
      #post_via_redirect new_user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
      page.driver.post new_user_session_path, 'user[email]' => @user.email, 'user[password]' => 'password123'
	  visit new_question_path

    end
    describe "GET 'questions/new'" do

      it "shows new question form" do
      
      expect(page).not_to have_css('form#new_user'), "#{page.body}"
      expect(page).to have_css('form#new_question'), "#{page.body}"

      end
    end
  end


end
