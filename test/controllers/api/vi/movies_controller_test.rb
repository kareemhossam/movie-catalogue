require "test_helper"

class Api::Vi::MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_vi_movies_show_url
    assert_response :success
  end

  test "should get index" do
    get api_vi_movies_index_url
    assert_response :success
  end

  test "should get create" do
    get api_vi_movies_create_url
    assert_response :success
  end

  test "should get update" do
    get api_vi_movies_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_vi_movies_destroy_url
    assert_response :success
  end
end
