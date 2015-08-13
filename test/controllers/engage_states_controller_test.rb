require 'test_helper'

class EngageStatesControllerTest < ActionController::TestCase
  setup do
    @engage_state = engage_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:engage_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create engage_state" do
    assert_difference('EngageState.count') do
      post :create, engage_state: { post_id: @engage_state.post_id, question_number: @engage_state.question_number, user_id: @engage_state.user_id }
    end

    assert_redirected_to engage_state_path(assigns(:engage_state))
  end

  test "should show engage_state" do
    get :show, id: @engage_state
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @engage_state
    assert_response :success
  end

  test "should update engage_state" do
    patch :update, id: @engage_state, engage_state: { post_id: @engage_state.post_id, question_number: @engage_state.question_number, user_id: @engage_state.user_id }
    assert_redirected_to engage_state_path(assigns(:engage_state))
  end

  test "should destroy engage_state" do
    assert_difference('EngageState.count', -1) do
      delete :destroy, id: @engage_state
    end

    assert_redirected_to engage_states_path
  end
end
