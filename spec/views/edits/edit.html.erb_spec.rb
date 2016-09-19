require 'rails_helper'

RSpec.describe "edits/edit", type: :view do
  before(:each) do
    @edit = assign(:edit, Edit.create!(
      :body => "MyText",
      :user => nil,
      :answer => nil
    ))
  end

  it "renders the edit edit form" do
    render

    assert_select "form[action=?][method=?]", edit_path(@edit), "post" do

      assert_select "textarea#edit_body[name=?]", "edit[body]"

      assert_select "input#edit_user_id[name=?]", "edit[user_id]"

      assert_select "input#edit_answer_id[name=?]", "edit[answer_id]"
    end
  end
end
