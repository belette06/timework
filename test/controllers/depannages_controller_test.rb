require "test_helper"

class DepannagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get depannages_new_url
    assert_response :success
  end

  test "should get edit" do
    get depannages_edit_url
    assert_response :success
  end

  test "should get show" do
    get depannages_show_url
    assert_response :success
  end

  test "should get index" do
    get depannages_index_url
    assert_response :success
  end
end
