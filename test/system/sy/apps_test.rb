require "application_system_test_case"

class Sy::AppsTest < ApplicationSystemTestCase
  setup do
    @sy_app = sy_apps(:one)
  end

  test "visiting the index" do
    visit sy_apps_url
    assert_selector "h1", text: "Sy/Apps"
  end

  test "creating a App" do
    visit sy_apps_url
    click_on "New Sy/App"

    fill_in "Abbr", with: @sy_app.abbr
    fill_in "Name", with: @sy_app.name
    click_on "Create App"

    assert_text "App was successfully created"
    click_on "Back"
  end

  test "updating a App" do
    visit sy_apps_url
    click_on "Edit", match: :first

    fill_in "Abbr", with: @sy_app.abbr
    fill_in "Name", with: @sy_app.name
    click_on "Update App"

    assert_text "App was successfully updated"
    click_on "Back"
  end

  test "destroying a App" do
    visit sy_apps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "App was successfully destroyed"
  end
end
