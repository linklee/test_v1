require 'rails_helper'

RSpec.describe "edits/new", type: :view do
  before(:each) do
    assign(:edit, Edit.new(
      :body => "MyText",
      :user => nil,
      :answer => nil
    ))
  end

  it "renders new edit form" do
    render

    assert_select "form[action=?][method=?]", edits_path, "post" do

      assert_select "textarea#edit_body[name=?]", "edit[body]"

      assert_select "input#edit_user_id[name=?]", "edit[user_id]"

      assert_select "input#edit_answer_id[name=?]", "edit[answer_id]"
    end
  end
end
