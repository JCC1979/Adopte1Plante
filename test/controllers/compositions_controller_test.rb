require 'test_helper'

class CompositionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get compositions_index_url
    assert_response :success
  end

  test "should get show" do
    get compositions_show_url
    assert_response :success
  end

end
