require 'rails_helper'

RSpec.describe "test_results/index", type: :view do
  before(:each) do
    assign(:test_results, [
      TestResult.create!(
        :status => "Status",
        :github_branch => "",
        :gihub_pull_request => 2
      ),
      TestResult.create!(
        :status => "Status",
        :github_branch => "",
        :gihub_pull_request => 2
      )
    ])
  end

  it "renders a list of test_results" do
    render
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
