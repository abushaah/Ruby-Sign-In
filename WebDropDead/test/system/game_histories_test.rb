require "application_system_test_case"

class GameHistoriesTest < ApplicationSystemTestCase
  setup do
    @game_history = game_histories(:one)
  end

  test "visiting the index" do
    visit game_histories_url
    assert_selector "h1", text: "Game Histories"
  end

  test "creating a Game history" do
    visit game_histories_url
    click_on "New Game History"

    fill_in "Date played", with: @game_history.date_played
    fill_in "Game", with: @game_history.game_id
    fill_in "User", with: @game_history.user_id
    click_on "Create Game history"

    assert_text "Game history was successfully created"
    click_on "Back"
  end

  test "updating a Game history" do
    visit game_histories_url
    click_on "Edit", match: :first

    fill_in "Date played", with: @game_history.date_played
    fill_in "Game", with: @game_history.game_id
    fill_in "User", with: @game_history.user_id
    click_on "Update Game history"

    assert_text "Game history was successfully updated"
    click_on "Back"
  end

  test "destroying a Game history" do
    visit game_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game history was successfully destroyed"
  end
end
