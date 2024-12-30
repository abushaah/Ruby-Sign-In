require "test_helper"

class GameHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_history = game_histories(:one)
  end

  test "should get index" do
    get game_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_game_history_url
    assert_response :success
  end

  test "should create game_history" do
    assert_difference('GameHistory.count') do
      post game_histories_url, params: { game_history: { date_played: @game_history.date_played, game_id: @game_history.game_id, user_id: @game_history.user_id } }
    end

    assert_redirected_to game_history_url(GameHistory.last)
  end

  test "should show game_history" do
    get game_history_url(@game_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_history_url(@game_history)
    assert_response :success
  end

  test "should update game_history" do
    patch game_history_url(@game_history), params: { game_history: { date_played: @game_history.date_played, game_id: @game_history.game_id, user_id: @game_history.user_id } }
    assert_redirected_to game_history_url(@game_history)
  end

  test "should destroy game_history" do
    assert_difference('GameHistory.count', -1) do
      delete game_history_url(@game_history)
    end

    assert_redirected_to game_histories_url
  end
end
