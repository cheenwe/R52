require "application_system_test_case"

class Bz::VersionsTest < ApplicationSystemTestCase
  setup do
    @bz_version = bz_versions(:one)
  end

  test "visiting the index" do
    visit bz_versions_url
    assert_selector "h1", text: "Bz/Versions"
  end

  test "creating a Version" do
    visit bz_versions_url
    click_on "New Bz/Version"

    fill_in "File", with: @bz_version.file
    fill_in "Remark", with: @bz_version.remark
    fill_in "Tool", with: @bz_version.tool_id
    fill_in "Version", with: @bz_version.version
    click_on "Create Version"

    assert_text "Version was successfully created"
    click_on "Back"
  end

  test "updating a Version" do
    visit bz_versions_url
    click_on "Edit", match: :first

    fill_in "File", with: @bz_version.file
    fill_in "Remark", with: @bz_version.remark
    fill_in "Tool", with: @bz_version.tool_id
    fill_in "Version", with: @bz_version.version
    click_on "Update Version"

    assert_text "Version was successfully updated"
    click_on "Back"
  end

  test "destroying a Version" do
    visit bz_versions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Version was successfully destroyed"
  end
end
