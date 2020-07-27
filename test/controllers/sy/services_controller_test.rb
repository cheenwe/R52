require 'test_helper'

class Sy::ServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sy_service = sy_services(:one)
  end

  test "should get index" do
    get sy_services_url
    assert_response :success
  end

  test "should get new" do
    get new_sy_service_url
    assert_response :success
  end

  test "should create sy_service" do
    assert_difference('Sy::Service.count') do
      post sy_services_url, params: { sy_service: { abbr: @sy_service.abbr, app_id: @sy_service.app_id, is_open: @sy_service.is_open, name: @sy_service.name, remark: @sy_service.remark } }
    end

    assert_redirected_to sy_service_url(Sy::Service.last)
  end

  test "should show sy_service" do
    get sy_service_url(@sy_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_sy_service_url(@sy_service)
    assert_response :success
  end

  test "should update sy_service" do
    patch sy_service_url(@sy_service), params: { sy_service: { abbr: @sy_service.abbr, app_id: @sy_service.app_id, is_open: @sy_service.is_open, name: @sy_service.name, remark: @sy_service.remark } }
    assert_redirected_to sy_service_url(@sy_service)
  end

  test "should destroy sy_service" do
    assert_difference('Sy::Service.count', -1) do
      delete sy_service_url(@sy_service)
    end

    assert_redirected_to sy_services_url
  end
end
