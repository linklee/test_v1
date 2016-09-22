require 'rails_helper'

RSpec.describe "answers/index", type: :view do
  before(:each) do
    assign(:answers, [
      Answer.create!(
        :body => "MyText",
        :user => nil,
        :question => nil
      ),
      Answer.create!(
        :body => "MyText",
        :user => nil,
        :question => nil
      )
    ])
  end

  
end
