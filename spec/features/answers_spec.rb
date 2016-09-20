require 'spec_helper'
require 'rails_helper'

RSpec.describe "Answers", type: :request do
  let(:user) { FactoryGirl.create(:user) }
  let!(:q) { FactoryGirl.create(:question, user: user, body: "sample text", title: "sample title") }

  before { visit question_path(q) }
  describe "click on new answer link should remove class 'hidden' at '.new-answer-form'" do
    it "should see text_field for new question" do
      #find our link that removes class hidden from form
      a = page.find(".show-answer-link")
      #check if form still hidden
      expect(page).to have_css(".new-answer-form.hidden"), "#{page.body}"
      #click on link
      a.click
      #check that form is not hidden
      expect(page).not_to have_css(".new-answer-form.hidden"), "#{page.body}"
    end
  end
end
