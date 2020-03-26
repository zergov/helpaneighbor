require 'test_helper'

class HelpNowControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get help_now_show_url
    assert_response :success
  end

end
