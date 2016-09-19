require 'rails_helper'

RSpec.describe "Edits", type: :request do
  describe "GET /edits" do
    it "works! (now write some real specs)" do
      get edits_path
      expect(response).to have_http_status(200)
    end
  end
end
