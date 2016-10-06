require 'rails_helper'

RSpec.describe "test_result_items/show", type: :view do
  before(:each) do
    @test_result_item = assign(:test_result_item, TestResultItem.create!(
      :status => "Status",
      :test_result_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/2/)
  end
end
