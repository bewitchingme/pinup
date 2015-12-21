require 'test_helper'

class SidekiqTestsControllerTest < ActionController::TestCase
  setup do
    @sidekiq_test = sidekiq_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sidekiq_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sidekiq_test" do
    assert_difference('SidekiqTest.count') do
      post :create, sidekiq_test: { count: @sidekiq_test.count, text: @sidekiq_test.text }
    end

    assert_redirected_to sidekiq_test_path(assigns(:sidekiq_test))
  end

  test "should show sidekiq_test" do
    get :show, id: @sidekiq_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sidekiq_test
    assert_response :success
  end

  test "should update sidekiq_test" do
    patch :update, id: @sidekiq_test, sidekiq_test: { count: @sidekiq_test.count, text: @sidekiq_test.text }
    assert_redirected_to sidekiq_test_path(assigns(:sidekiq_test))
  end

  test "should destroy sidekiq_test" do
    assert_difference('SidekiqTest.count', -1) do
      delete :destroy, id: @sidekiq_test
    end

    assert_redirected_to sidekiq_tests_path
  end
end
