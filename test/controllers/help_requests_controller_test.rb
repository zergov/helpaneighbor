require 'test_helper'

class HelpRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get help_requests_new_url
    assert_response :success
  end

  test "should get create" do
    get help_requests_create_url
    assert_response :success
  end

end
