require 'test_helper'

class Sy::InfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sy_info = sy_infos(:one)
  end

  test "should get index" do
    get sy_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_sy_info_url
    assert_response :success
  end

  test "should create sy_info" do
    assert_difference('Sy::Info.count') do
      post sy_infos_url, params: { sy_info: { reason: @sy_info.reason, send_at: @sy_info.send_at, service_id: @sy_info.service_id, state: @sy_info.state } }
    end

    assert_redirected_to sy_info_url(Sy::Info.last)
  end

  test "should show sy_info" do
    get sy_info_url(@sy_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_sy_info_url(@sy_info)
    assert_response :success
  end

  test "should update sy_info" do
    patch sy_info_url(@sy_info), params: { sy_info: { reason: @sy_info.reason, send_at: @sy_info.send_at, service_id: @sy_info.service_id, state: @sy_info.state } }
    assert_redirected_to sy_info_url(@sy_info)
  end

  test "should destroy sy_info" do
    assert_difference('Sy::Info.count', -1) do
      delete sy_info_url(@sy_info)
    end

    assert_redirected_to sy_infos_url
  end
end
