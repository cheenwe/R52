require "application_system_test_case"

class Bz::ToolsTest < ApplicationSystemTestCase
  setup do
    @bz_tool = bz_tools(:one)
  end

  test "visiting the index" do
    visit bz_tools_url
    assert_selector "h1", text: "Bz/Tools"
  end

  test "creating a Tool" do
    visit bz_tools_url
    click_on "New Bz/Tool"

    fill_in "Name", with: @bz_tool.name
    fill_in "Project", with: @bz_tool.project
    fill_in "Purpose", with: @bz_tool.purpose
    fill_in "Remark", with: @bz_tool.remark
    fill_in "Url", with: @bz_tool.url
    fill_in "Version", with: @bz_tool.version
    click_on "Create Tool"

    assert_text "Tool was successfully created"
    click_on "Back"
  end

  test "updating a Tool" do
    visit bz_tools_url
    click_on "Edit", match: :first

    fill_in "Name", with: @bz_tool.name
    fill_in "Project", with: @bz_tool.project
    fill_in "Purpose", with: @bz_tool.purpose
    fill_in "Remark", with: @bz_tool.remark
    fill_in "Url", with: @bz_tool.url
    fill_in "Version", with: @bz_tool.version
    click_on "Update Tool"

    assert_text "Tool was successfully updated"
    click_on "Back"
  end

  test "destroying a Tool" do
    visit bz_tools_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tool was successfully destroyed"
  end
end
