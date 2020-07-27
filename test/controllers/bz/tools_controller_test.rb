require 'test_helper'

class Bz::ToolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bz_tool = bz_tools(:one)
  end

  test "should get index" do
    get bz_tools_url
    assert_response :success
  end

  test "should get new" do
    get new_bz_tool_url
    assert_response :success
  end

  test "should create bz_tool" do
    assert_difference('Bz::Tool.count') do
      post bz_tools_url, params: { bz_tool: { name: @bz_tool.name, project: @bz_tool.project, purpose: @bz_tool.purpose, remark: @bz_tool.remark, url: @bz_tool.url, version: @bz_tool.version } }
    end

    assert_redirected_to bz_tool_url(Bz::Tool.last)
  end

  test "should show bz_tool" do
    get bz_tool_url(@bz_tool)
    assert_response :success
  end

  test "should get edit" do
    get edit_bz_tool_url(@bz_tool)
    assert_response :success
  end

  test "should update bz_tool" do
    patch bz_tool_url(@bz_tool), params: { bz_tool: { name: @bz_tool.name, project: @bz_tool.project, purpose: @bz_tool.purpose, remark: @bz_tool.remark, url: @bz_tool.url, version: @bz_tool.version } }
    assert_redirected_to bz_tool_url(@bz_tool)
  end

  test "should destroy bz_tool" do
    assert_difference('Bz::Tool.count', -1) do
      delete bz_tool_url(@bz_tool)
    end

    assert_redirected_to bz_tools_url
  end
end
