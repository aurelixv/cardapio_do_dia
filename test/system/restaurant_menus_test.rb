require "application_system_test_case"

class RestaurantMenusTest < ApplicationSystemTestCase
  setup do
    @restaurant_menu = restaurant_menus(:one)
  end

  test "visiting the index" do
    visit restaurant_menus_url
    assert_selector "h1", text: "Restaurant Menus"
  end

  test "creating a Restaurant menu" do
    visit restaurant_menus_url
    click_on "New Restaurant Menu"

    fill_in "Name", with: @restaurant_menu.name
    click_on "Create Restaurant menu"

    assert_text "Restaurant menu was successfully created"
    click_on "Back"
  end

  test "updating a Restaurant menu" do
    visit restaurant_menus_url
    click_on "Edit", match: :first

    fill_in "Name", with: @restaurant_menu.name
    click_on "Update Restaurant menu"

    assert_text "Restaurant menu was successfully updated"
    click_on "Back"
  end

  test "destroying a Restaurant menu" do
    visit restaurant_menus_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Restaurant menu was successfully destroyed"
  end
end
