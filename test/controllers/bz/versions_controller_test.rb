require 'test_helper'

class Bz::VersionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bz_version = bz_versions(:one)
  end

  test "should get index" do
    get bz_versions_url
    assert_response :success
  end

  test "should get new" do
    get new_bz_version_url
    assert_response :success
  end

  test "should create bz_version" do
    assert_difference('Bz::Version.count') do
      post bz_versions_url, params: { bz_version: { file: @bz_version.file, remark: @bz_version.remark, tool_id: @bz_version.tool_id, version: @bz_version.version } }
    end

    assert_redirected_to bz_version_url(Bz::Version.last)
  end

  test "should show bz_version" do
    get bz_version_url(@bz_version)
    assert_response :success
  end

  test "should get edit" do
    get edit_bz_version_url(@bz_version)
    assert_response :success
  end

  test "should update bz_version" do
    patch bz_version_url(@bz_version), params: { bz_version: { file: @bz_version.file, remark: @bz_version.remark, tool_id: @bz_version.tool_id, version: @bz_version.version } }
    assert_redirected_to bz_version_url(@bz_version)
  end

  test "should destroy bz_version" do
    assert_difference('Bz::Version.count', -1) do
      delete bz_version_url(@bz_version)
    end

    assert_redirected_to bz_versions_url
  end
end
