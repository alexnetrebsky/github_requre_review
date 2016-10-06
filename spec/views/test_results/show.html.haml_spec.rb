require 'rails_helper'

RSpec.describe "test_results/show", type: :view do
  before(:each) do
    @test_result = assign(:test_result, TestResult.create!(
      :status => "Status",
      :github_branch => "",
      :gihub_pull_request => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Status/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
