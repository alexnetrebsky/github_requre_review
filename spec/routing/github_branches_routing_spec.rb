require "rails_helper"

RSpec.describe GithubBranchesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/github_branches").to route_to("github_branches#index")
    end

    it "routes to #new" do
      expect(:get => "/github_branches/new").to route_to("github_branches#new")
    end

    it "routes to #show" do
      expect(:get => "/github_branches/1").to route_to("github_branches#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/github_branches/1/edit").to route_to("github_branches#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/github_branches").to route_to("github_branches#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/github_branches/1").to route_to("github_branches#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/github_branches/1").to route_to("github_branches#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/github_branches/1").to route_to("github_branches#destroy", :id => "1")
    end

  end
end
