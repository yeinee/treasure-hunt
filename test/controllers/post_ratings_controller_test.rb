require 'test_helper'

class PostRatingsControllerTest < ActionController::TestCase
  setup do
    @post_rating = post_ratings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_ratings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_rating" do
    assert_difference('PostRating.count') do
      post :create, post_rating: { post_id: @post_rating.post_id, rating: @post_rating.rating, user_id: @post_rating.user_id }
    end

    assert_redirected_to post_rating_path(assigns(:post_rating))
  end

  test "should show post_rating" do
    get :show, id: @post_rating
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_rating
    assert_response :success
  end

  test "should update post_rating" do
    patch :update, id: @post_rating, post_rating: { post_id: @post_rating.post_id, rating: @post_rating.rating, user_id: @post_rating.user_id }
    assert_redirected_to post_rating_path(assigns(:post_rating))
  end

  test "should destroy post_rating" do
    assert_difference('PostRating.count', -1) do
      delete :destroy, id: @post_rating
    end

    assert_redirected_to post_ratings_path
  end
end
