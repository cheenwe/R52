require "application_system_test_case"

class Sy::InfosTest < ApplicationSystemTestCase
  setup do
    @sy_info = sy_infos(:one)
  end

  test "visiting the index" do
    visit sy_infos_url
    assert_selector "h1", text: "Sy/Infos"
  end

  test "creating a Info" do
    visit sy_infos_url
    click_on "New Sy/Info"

    fill_in "Reason", with: @sy_info.reason
    fill_in "Send at", with: @sy_info.send_at
    fill_in "Service", with: @sy_info.service_id
    fill_in "State", with: @sy_info.state
    click_on "Create Info"

    assert_text "Info was successfully created"
    click_on "Back"
  end

  test "updating a Info" do
    visit sy_infos_url
    click_on "Edit", match: :first

    fill_in "Reason", with: @sy_info.reason
    fill_in "Send at", with: @sy_info.send_at
    fill_in "Service", with: @sy_info.service_id
    fill_in "State", with: @sy_info.state
    click_on "Update Info"

    assert_text "Info was successfully updated"
    click_on "Back"
  end

  test "destroying a Info" do
    visit sy_infos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Info was successfully destroyed"
  end
end
