require "test_helper"

class Admin::ComicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_comics_index_url
    assert_response :success
  end
end
