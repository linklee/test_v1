require 'rails_helper'

RSpec.describe "answers/new", type: :view do
  before(:each) do
    assign(:answer, Answer.new(
      :body => "MyText",
      :user => nil,
      :question => nil
    ))
  end

 
end
