require 'rails_helper'

RSpec.describe "edits/index", type: :view do
  before(:each) do
    assign(:edits, [
      Edit.create!(
        :body => "MyText",
        :user => nil,
        :answer => nil
      ),
      Edit.create!(
        :body => "MyText",
        :user => nil,
        :answer => nil
      )
    ])
  end

  it "renders a list of edits" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
