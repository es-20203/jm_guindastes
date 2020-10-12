require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  test 'should save vehicle with category, board and status' do
    vehicle = Vehicle.new  category: 'crane', board: '1234567', status: 'available'
    assert vehicle.save
  end

  test 'should delete vehicle' do
    vehicle = Vehicle.new  category: 'crane', board: '1234567', status: 'available'
    assert vehicle.save
    assert vehicle.delete 
  end

  test 'should not save vehicle without category' do
    vehicle = Vehicle.new  category: '', board: '1234567', status: 'available'
    assert_not vehicle.save
  end

end
