# frozen_string_literal: true

require 'test_helper'

class StationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @station = Station.create(name: 'Test Railway Junction', location: 'Jalpaiguri, WB')
    get '/users/sign_in'
  end

  test 'should get index' do
    sign_in users(:user_001)
    post user_session_url
    get stations_url
    assert_response :success
  end

  test 'should get new' do
    sign_in users(:user_001)
    post user_session_url
    get new_station_url
    assert_response :success
  end

  test 'should create station' do
    sign_in users(:user_001)
    post user_session_url
    assert_difference('Station.count', 1) do
      post stations_url, params: { station: { name: 'New Jalpaiguri Station', location: 'Jalpaiguri' } }
    end

    assert_redirected_to stations_url
  end

  test 'should not create station if not admin' do
    sign_in users(:user_002)
    post user_session_url
    assert_no_difference('Station.count') do
      post stations_url, params: { station: { name: 'New Jalpaiguri Station', location: 'Jalpaiguri' } }
    end

    assert_redirected_to root_path
  end
end
