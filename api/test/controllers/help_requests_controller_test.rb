require 'test_helper'

class HelpRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get help_requests_create_url
    assert_response :success
  end

end
