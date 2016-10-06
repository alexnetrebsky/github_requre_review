require 'rails_helper'

RSpec.describe "test_result_items/edit", type: :view do
  before(:each) do
    @test_result_item = assign(:test_result_item, TestResultItem.create!(
      :status => "MyString",
      :test_result_id => 1
    ))
  end

  it "renders the edit test_result_item form" do
    render

    assert_select "form[action=?][method=?]", test_result_item_path(@test_result_item), "post" do

      assert_select "input#test_result_item_status[name=?]", "test_result_item[status]"

      assert_select "input#test_result_item_test_result_id[name=?]", "test_result_item[test_result_id]"
    end
  end
end
