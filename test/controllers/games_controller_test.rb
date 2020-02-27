require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get games_index_url
    assert_response :success
  end

  test "should get new" do
    get games_new_url
    assert_response :success
  end

  test "should get create" do
    get games_create_url
    assert_response :success
  end

  test "should get show" do
    get games_show_url
    assert_response :success
  end

  test "should get edit" do
    get games_edit_url
    assert_response :success
  end

  test "should get update" do
    get games_update_url
    assert_response :success
  end

  test "should get destroy" do
    get games_destroy_url
    assert_response :success
  end

  test "should get set_game" do
    get games_set_game_url
    assert_response :success
  end

  test "should get game_params" do
    get games_game_params_url
    assert_response :success
  end

end
