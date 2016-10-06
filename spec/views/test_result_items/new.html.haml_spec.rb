require 'rails_helper'

RSpec.describe "test_result_items/new", type: :view do
  before(:each) do
    assign(:test_result_item, TestResultItem.new(
      :status => "MyString",
      :test_result_id => 1
    ))
  end

  it "renders new test_result_item form" do
    render

    assert_select "form[action=?][method=?]", test_result_items_path, "post" do

      assert_select "input#test_result_item_status[name=?]", "test_result_item[status]"

      assert_select "input#test_result_item_test_result_id[name=?]", "test_result_item[test_result_id]"
    end
  end
end
