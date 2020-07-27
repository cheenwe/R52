require 'test_helper'

class Sy::AppsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sy_app = sy_apps(:one)
  end

  test "should get index" do
    get sy_apps_url
    assert_response :success
  end

  test "should get new" do
    get new_sy_app_url
    assert_response :success
  end

  test "should create sy_app" do
    assert_difference('Sy::App.count') do
      post sy_apps_url, params: { sy_app: { abbr: @sy_app.abbr, name: @sy_app.name } }
    end

    assert_redirected_to sy_app_url(Sy::App.last)
  end

  test "should show sy_app" do
    get sy_app_url(@sy_app)
    assert_response :success
  end

  test "should get edit" do
    get edit_sy_app_url(@sy_app)
    assert_response :success
  end

  test "should update sy_app" do
    patch sy_app_url(@sy_app), params: { sy_app: { abbr: @sy_app.abbr, name: @sy_app.name } }
    assert_redirected_to sy_app_url(@sy_app)
  end

  test "should destroy sy_app" do
    assert_difference('Sy::App.count', -1) do
      delete sy_app_url(@sy_app)
    end

    assert_redirected_to sy_apps_url
  end
end
