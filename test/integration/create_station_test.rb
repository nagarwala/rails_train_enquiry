# frozen_string_literal: true

require 'test_helper'

class CreateStationTest < ActionDispatch::IntegrationTest
  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
  end

  test 'get new station form and create station' do
    get '/stations/new'
    assert_response :success
    assert_difference 'Station.count', 1 do
      post stations_path, params: { station: { name: 'Test Railway', location: 'Test Junction' } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match 'Test Railway', response.body
  end

  test 'get new station form and reject invaild station submission' do
    get '/stations/new'
    assert_response :success
    assert_no_difference 'Station.count' do
      post stations_path, params: { station: { name: ' ', location: ' ' } }
    end
    assert_match 'errors', response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end
end
