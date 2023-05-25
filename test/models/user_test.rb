# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'User should be valid' do
    @user = User.new(email: 'nitesh@example1.com', password: 'password')
    assert @user.valid?
  end
end
