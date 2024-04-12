require "test_helper"

class TokenControllerTest < ActionDispatch::IntegrationTest
  test "should get refresh" do
    get token_refresh_url
    assert_response :success
  end
end
