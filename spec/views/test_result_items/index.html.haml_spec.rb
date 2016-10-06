require 'rails_helper'

RSpec.describe "test_result_items/index", type: :view do
  before(:each) do
    assign(:test_result_items, [
      TestResultItem.create!(
        :status => "Status",
        :test_result_id => 2
      ),
      TestResultItem.create!(
        :status => "Status",
        :test_result_id => 2
      )
    ])
  end

  it "renders a list of test_result_items" do
    render
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
