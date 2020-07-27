require "application_system_test_case"

class Sy::AlarmsTest < ApplicationSystemTestCase
  setup do
    @sy_alarm = sy_alarms(:one)
  end

  test "visiting the index" do
    visit sy_alarms_url
    assert_selector "h1", text: "Sy/Alarms"
  end

  test "creating a Alarm" do
    visit sy_alarms_url
    click_on "New Sy/Alarm"

    fill_in "Alarm at", with: @sy_alarm.alarm_at
    fill_in "Reason", with: @sy_alarm.reason
    fill_in "Service", with: @sy_alarm.service_id
    click_on "Create Alarm"

    assert_text "Alarm was successfully created"
    click_on "Back"
  end

  test "updating a Alarm" do
    visit sy_alarms_url
    click_on "Edit", match: :first

    fill_in "Alarm at", with: @sy_alarm.alarm_at
    fill_in "Reason", with: @sy_alarm.reason
    fill_in "Service", with: @sy_alarm.service_id
    click_on "Update Alarm"

    assert_text "Alarm was successfully updated"
    click_on "Back"
  end

  test "destroying a Alarm" do
    visit sy_alarms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Alarm was successfully destroyed"
  end
end
