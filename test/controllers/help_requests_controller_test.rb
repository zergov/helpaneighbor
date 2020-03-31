require 'test_helper'

class HelpRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    cookies[:locale] = 'en'
  end

  test "when creating a new help request, the creator uuid is set in creator_uuid cookie" do
    assert_nil cookies[:creator_uuid]
    params = {
      help_request: {
        name: "Jonathan Lalande",
        description: "pls halp",
        conditions: [],
        address: "some random address",
        address_lat: "45.4544",
        address_lon: "-73.5832",
        security_number: "664863",
      }
    }

    post new_help_request_path, params: params
    assert_response :redirect
    assert_not_nil cookies[:creator_uuid]
    assert_equal HelpRequest.last.creator_uuid, cookies[:creator_uuid]
  end

  test "redirect to confirm security_number page if creator_uuid does not match when trying to edit" do
    assert_nil cookies[:creator_uuid]
    help_request = help_requests(:monique_request)
    get edit_help_request_path(uuid: help_request.uuid)
    assert_redirected_to help_request_confirm_security_number_path(uuid: help_request.uuid)
  end

  test "#confirm_security_number with right security_number redirects to #edit and set creator_uuid cookie" do
    help_request = help_requests(:monique_request)
    post help_request_confirm_security_number_path(uuid: help_request.uuid), params: {security_number: "123321"}
    assert_redirected_to edit_help_request_path(uuid: help_request.uuid)
    assert_equal help_request.creator_uuid, cookies[:creator_uuid]
  end

  test "#confirm_security_number with wrong security_number does not redirects to #edit" do
    help_request = help_requests(:monique_request)
    post help_request_confirm_security_number_path(uuid: help_request.uuid), params: {security_number: "invalid number"}
    assert_response :ok
    assert_not_equal help_request.creator_uuid, cookies[:creator_uuid]
  end
end
