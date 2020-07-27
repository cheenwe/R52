require "application_system_test_case"

class Sy::ConfigsTest < ApplicationSystemTestCase
  setup do
    @sy_config = sy_configs(:one)
  end

  test "visiting the index" do
    visit sy_configs_url
    assert_selector "h1", text: "Sy/Configs"
  end

  test "creating a Config" do
    visit sy_configs_url
    click_on "New Sy/Config"

    fill_in "Value", with: @sy_config.value
    fill_in "Var", with: @sy_config.var
    click_on "Create Config"

    assert_text "Config was successfully created"
    click_on "Back"
  end

  test "updating a Config" do
    visit sy_configs_url
    click_on "Edit", match: :first

    fill_in "Value", with: @sy_config.value
    fill_in "Var", with: @sy_config.var
    click_on "Update Config"

    assert_text "Config was successfully updated"
    click_on "Back"
  end

  test "destroying a Config" do
    visit sy_configs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Config was successfully destroyed"
  end
end
