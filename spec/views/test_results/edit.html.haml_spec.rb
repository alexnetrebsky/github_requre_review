require 'rails_helper'

RSpec.describe "test_results/edit", type: :view do
  before(:each) do
    @test_result = assign(:test_result, TestResult.create!(
      :status => "MyString",
      :github_branch => "",
      :gihub_pull_request => 1
    ))
  end

  it "renders the edit test_result form" do
    render

    assert_select "form[action=?][method=?]", test_result_path(@test_result), "post" do

      assert_select "input#test_result_status[name=?]", "test_result[status]"

      assert_select "input#test_result_github_branch[name=?]", "test_result[github_branch]"

      assert_select "input#test_result_gihub_pull_request[name=?]", "test_result[gihub_pull_request]"
    end
  end
end
