require 'test_helper'

class Sy::AlarmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sy_alarm = sy_alarms(:one)
  end

  test "should get index" do
    get sy_alarms_url
    assert_response :success
  end

  test "should get new" do
    get new_sy_alarm_url
    assert_response :success
  end

  test "should create sy_alarm" do
    assert_difference('Sy::Alarm.count') do
      post sy_alarms_url, params: { sy_alarm: { alarm_at: @sy_alarm.alarm_at, reason: @sy_alarm.reason, service_id: @sy_alarm.service_id } }
    end

    assert_redirected_to sy_alarm_url(Sy::Alarm.last)
  end

  test "should show sy_alarm" do
    get sy_alarm_url(@sy_alarm)
    assert_response :success
  end

  test "should get edit" do
    get edit_sy_alarm_url(@sy_alarm)
    assert_response :success
  end

  test "should update sy_alarm" do
    patch sy_alarm_url(@sy_alarm), params: { sy_alarm: { alarm_at: @sy_alarm.alarm_at, reason: @sy_alarm.reason, service_id: @sy_alarm.service_id } }
    assert_redirected_to sy_alarm_url(@sy_alarm)
  end

  test "should destroy sy_alarm" do
    assert_difference('Sy::Alarm.count', -1) do
      delete sy_alarm_url(@sy_alarm)
    end

    assert_redirected_to sy_alarms_url
  end
end
