require 'test_helper'

class PracticesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get practices_index_url
    assert_response :success
  end

  test "should get show" do
    get practices_show_url
    assert_response :success
  end

  test "should get edit" do
    get practices_edit_url
    assert_response :success
  end

  test "should get update" do
    get practices_update_url
    assert_response :success
  end

  test "should get destroy" do
    get practices_destroy_url
    assert_response :success
  end

end
