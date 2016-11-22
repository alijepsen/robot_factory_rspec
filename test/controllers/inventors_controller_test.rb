require 'test_helper'

class InventorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inventors_index_url
    assert_response :success
  end

  test "should get edit" do
    get inventors_edit_url
    assert_response :success
  end

  test "should get new" do
    get inventors_new_url
    assert_response :success
  end

  test "should get show" do
    get inventors_show_url
    assert_response :success
  end

end
