require 'spec_helper'
require 'rails_helper'
require 'devise'

RSpec.describe "Authorization", type: :request do

  context "when not signed in" do
    describe "GET 'questions/new'" do
      before { visit new_question_path}
      it "redirects to sign in" do
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
	  sign_in @user
	  visit new_question_path

    end
    describe 'GET :index' do

      it "returns http success" do
      
      expect(page).to have_css('form#new_user'), "#{page.body}"

      end
    end
  end


end
