require 'rails_helper'

RSpec.describe "github_branches/new", type: :view do
  before(:each) do
    assign(:github_branch, GithubBranch.new(
      :name => "MyString",
      :github_repository => ""
    ))
  end

  it "renders new github_branch form" do
    render

    assert_select "form[action=?][method=?]", github_branches_path, "post" do

      assert_select "input#github_branch_name[name=?]", "github_branch[name]"

      assert_select "input#github_branch_github_repository[name=?]", "github_branch[github_repository]"
    end
  end
end
