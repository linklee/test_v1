require 'rails_helper'

RSpec.describe "answers/show", type: :view do
  before(:each) do
    @answer = assign(:answer, Answer.create!(
      :body => "MyText",
      :user => nil,
      :question => nil
    ))
  end

end
