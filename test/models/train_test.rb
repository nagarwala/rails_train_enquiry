# frozen_string_literal: true

require 'test_helper'

class TrainTest < ActiveSupport::TestCase
  def setup
    @train = Train.new(train_no: '12345', train_name: 'Superfast Express', starting_station: 'Test Station')
  end

  test 'train should be valid' do
    assert @train.valid?
  end

  test 'train name should be present' do
    @train.train_name = ' '
    assert_not @train.valid?
  end

  test 'train no. should be 5 letters' do
    @train.train_no = "1234"
    assert_not @train.valid?
  end
end
