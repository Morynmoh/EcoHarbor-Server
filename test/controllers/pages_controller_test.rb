require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get signin" do
    get pages_signin_url
    assert_response :success
  end
end
