require "test_helper"

class ObsessionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get obsession_index_url
    assert_response :success
  end
end
