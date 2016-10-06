require 'rails_helper'

RSpec.describe "github_branches/edit", type: :view do
  before(:each) do
    @github_branch = assign(:github_branch, GithubBranch.create!(
      :name => "MyString",
      :github_repository => ""
    ))
  end

  it "renders the edit github_branch form" do
    render

    assert_select "form[action=?][method=?]", github_branch_path(@github_branch), "post" do

      assert_select "input#github_branch_name[name=?]", "github_branch[name]"

      assert_select "input#github_branch_github_repository[name=?]", "github_branch[github_repository]"
    end
  end
end
