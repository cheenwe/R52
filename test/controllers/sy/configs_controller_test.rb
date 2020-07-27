require 'test_helper'

class Sy::ConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sy_config = sy_configs(:one)
  end

  test "should get index" do
    get sy_configs_url
    assert_response :success
  end

  test "should get new" do
    get new_sy_config_url
    assert_response :success
  end

  test "should create sy_config" do
    assert_difference('Sy::Config.count') do
      post sy_configs_url, params: { sy_config: { value: @sy_config.value, var: @sy_config.var } }
    end

    assert_redirected_to sy_config_url(Sy::Config.last)
  end

  test "should show sy_config" do
    get sy_config_url(@sy_config)
    assert_response :success
  end

  test "should get edit" do
    get edit_sy_config_url(@sy_config)
    assert_response :success
  end

  test "should update sy_config" do
    patch sy_config_url(@sy_config), params: { sy_config: { value: @sy_config.value, var: @sy_config.var } }
    assert_redirected_to sy_config_url(@sy_config)
  end

  test "should destroy sy_config" do
    assert_difference('Sy::Config.count', -1) do
      delete sy_config_url(@sy_config)
    end

    assert_redirected_to sy_configs_url
  end
end
