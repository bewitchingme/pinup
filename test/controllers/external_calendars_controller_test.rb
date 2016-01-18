# require 'test_helper'

# # KT@HOME - 2015/12/18: Might have broken this file when I changed lists to external_calendars

# class ExternalCalendarsControllerTest < ActionController::TestCase
#   setup do
#     @external_calendar = external_calendars(:one)
#   end

#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:external_calendars)
#   end

#   test "should get new" do
#     get :new
#     assert_response :success
#   end

#   test "should create external_calendar" do
#     assert_difference('ExternalCalendar.count') do
#       post :create, external_calendar: {  }
#     end

#     assert_redirected_to external_calendar_path(assigns(:external_calendar))
#   end

#   test "should show external_calendar" do
#     get :show, id: @external_calendar
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit, id: @external_calendar
#     assert_response :success
#   end

#   test "should update external_calendar" do
#     patch :update, id: @external_calendar, external_calendar: {  }
#     assert_redirected_to external_calendar_path(assigns(:external_calendar))
#   end

#   test "should destroy external_calendar" do
#     assert_difference('ExternalCalendar.count', -1) do
#       delete :destroy, id: @external_calendar
#     end

#     assert_redirected_to external_calendars_path
#   end
# end
