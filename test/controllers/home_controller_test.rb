require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "visitor_token is set if not already set" do
    refute cookies["visitor_token"]
    get homepage_path
    assert_response :success
    assert @response.cookies["visitor_token"]
  end

  test "visitor_token is not overriden if its already set" do
    get homepage_path
    assert_response :success
    visitor_token = @response.cookies["visitor_token"]

    cookies["visitor_token"] = visitor_token
    get homepage_path
    assert_nil @response.cookies["visitor_token"]
  end
end
