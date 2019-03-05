require 'test_helper'

class SynonymsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get synonyms_new_url
    assert_response :success
  end

  test "should get create" do
    get synonyms_create_url
    assert_response :success
  end

  test "should get show" do
    get synonyms_show_url
    assert_response :success
  end

  test "should get update" do
    get synonyms_update_url
    assert_response :success
  end

end
