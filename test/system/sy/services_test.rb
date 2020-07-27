require "application_system_test_case"

class Sy::ServicesTest < ApplicationSystemTestCase
  setup do
    @sy_service = sy_services(:one)
  end

  test "visiting the index" do
    visit sy_services_url
    assert_selector "h1", text: "Sy/Services"
  end

  test "creating a Service" do
    visit sy_services_url
    click_on "New Sy/Service"

    fill_in "Abbr", with: @sy_service.abbr
    fill_in "App", with: @sy_service.app_id
    check "Is open" if @sy_service.is_open
    fill_in "Name", with: @sy_service.name
    fill_in "Remark", with: @sy_service.remark
    click_on "Create Service"

    assert_text "Service was successfully created"
    click_on "Back"
  end

  test "updating a Service" do
    visit sy_services_url
    click_on "Edit", match: :first

    fill_in "Abbr", with: @sy_service.abbr
    fill_in "App", with: @sy_service.app_id
    check "Is open" if @sy_service.is_open
    fill_in "Name", with: @sy_service.name
    fill_in "Remark", with: @sy_service.remark
    click_on "Update Service"

    assert_text "Service was successfully updated"
    click_on "Back"
  end

  test "destroying a Service" do
    visit sy_services_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Service was successfully destroyed"
  end
end
