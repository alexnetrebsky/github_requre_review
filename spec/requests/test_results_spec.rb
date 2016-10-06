require 'rails_helper'

RSpec.describe "TestResults", type: :request do
  describe "GET /test_results" do
    it "works! (now write some real specs)" do
      get test_results_path
      expect(response).to have_http_status(200)
    end
  end
end
