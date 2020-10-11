require 'test_helper'

class VehicleTest < ActiveSupport::TestCase

  	test 'should save vehicle with category, board and status' do
  		user = User.new  cpf: '12345678', email: 'es@es.com', kind: 'ADM', password: '123456', password_confirmation: '123456'
    	user.save
    	vehicle = Vehicle.new  category: 'crane', board: '1234567', status: 'available'
    	assert vehicle.save
  	end

  	test 'should delete vehicle' do
  		user = User.new  cpf: '12345678', email: 'es@es.com', kind: 'ADM', password: '123456', password_confirmation: '123456'
    	user.save
    	vehicle = Vehicle.new  category: 'crane', board: '1234567', status: 'available'
    	assert vehicle.save
    	assert vehicle.delete 
  	end

  	test 'should not save vehicle without category' do
  		user = User.new  cpf: '12345678', email: 'es@es.com', kind: 'ADM', password: '123456', password_confirmation: '123456'
    	user.save
    	vehicle = Vehicle.new  category: '', board: '1234567', status: 'available'
    	assert_not vehicle.save
  	end

end
