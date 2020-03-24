require 'test_helper'

class ClocksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get clocks_new_url
    assert_response :success
  end

  test "should get index" do
    get clocks_index_url
    assert_response :success
  end

end
