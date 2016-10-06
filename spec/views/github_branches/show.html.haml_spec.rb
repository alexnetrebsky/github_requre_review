require 'rails_helper'

RSpec.describe "github_branches/show", type: :view do
  before(:each) do
    @github_branch = assign(:github_branch, GithubBranch.create!(
      :name => "Name",
      :github_repository => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
