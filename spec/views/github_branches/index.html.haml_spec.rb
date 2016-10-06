require 'rails_helper'

RSpec.describe "github_branches/index", type: :view do
  before(:each) do
    assign(:github_branches, [
      GithubBranch.create!(
        :name => "Name",
        :github_repository => ""
      ),
      GithubBranch.create!(
        :name => "Name",
        :github_repository => ""
      )
    ])
  end

  it "renders a list of github_branches" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
