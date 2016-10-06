require 'rails_helper'

RSpec.describe "GithubBranches", type: :request do
  describe "GET /github_branches" do
    it "works! (now write some real specs)" do
      get github_branches_path
      expect(response).to have_http_status(200)
    end
  end
end
