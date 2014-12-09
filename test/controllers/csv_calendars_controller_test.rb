require 'test_helper'

class CsvCalendarsControllerTest < ActionController::TestCase
  setup do
    @csv_calendar = csv_calendars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:csv_calendars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create csv_calendar" do
    assert_difference('CsvCalendar.count') do
      post :create, csv_calendar: {  }
    end

    assert_redirected_to csv_calendar_path(assigns(:csv_calendar))
  end

  test "should show csv_calendar" do
    get :show, id: @csv_calendar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @csv_calendar
    assert_response :success
  end

  test "should update csv_calendar" do
    patch :update, id: @csv_calendar, csv_calendar: {  }
    assert_redirected_to csv_calendar_path(assigns(:csv_calendar))
  end

  test "should destroy csv_calendar" do
    assert_difference('CsvCalendar.count', -1) do
      delete :destroy, id: @csv_calendar
    end

    assert_redirected_to csv_calendars_path
  end
end
