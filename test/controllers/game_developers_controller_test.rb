require 'test_helper'

class GameDevelopersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_developer = game_developers(:one)
  end

  test "should get index" do
    get game_developers_url, as: :json
    assert_response :success
  end

  test "should create game_developer" do
    assert_difference('GameDeveloper.count') do
      post game_developers_url, params: { game_developer: { user_id: @game_developer.user_id, username: @game_developer.username } }, as: :json
    end

    assert_response 201
  end

  test "should show game_developer" do
    get game_developer_url(@game_developer), as: :json
    assert_response :success
  end

  test "should update game_developer" do
    patch game_developer_url(@game_developer), params: { game_developer: { user_id: @game_developer.user_id, username: @game_developer.username } }, as: :json
    assert_response 200
  end

  test "should destroy game_developer" do
    assert_difference('GameDeveloper.count', -1) do
      delete game_developer_url(@game_developer), as: :json
    end

    assert_response 204
  end
end
