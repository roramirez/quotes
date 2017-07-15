require 'test_helper'

class CreditRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit_request = credit_requests(:one)
  end

  test "should get index" do
    get credit_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_credit_request_url
    assert_response :success
  end

  test "should create credit_request" do
    assert_difference('CreditRequest.count') do
      post credit_requests_url, params: { credit_request: { call_id: @credit_request.call_id, data: @credit_request.data } }
    end

    assert_redirected_to credit_request_url(CreditRequest.last)
  end

  test "should show credit_request" do
    get credit_request_url(@credit_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_credit_request_url(@credit_request)
    assert_response :success
  end

  test "should update credit_request" do
    patch credit_request_url(@credit_request), params: { credit_request: { call_id: @credit_request.call_id, data: @credit_request.data } }
    assert_redirected_to credit_request_url(@credit_request)
  end

  test "should destroy credit_request" do
    assert_difference('CreditRequest.count', -1) do
      delete credit_request_url(@credit_request)
    end

    assert_redirected_to credit_requests_url
  end
end
