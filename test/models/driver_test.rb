require 'test_helper'

class DriverTest < ActiveSupport::TestCase

  test 'should save driver with category, board , and status' do
  	user = User.new  cpf: '12345678', email: 'es@es.com', kind: 'ADM', password: '123456', password_confirmation: '123456'
    user.save
    driver = Driver.new name: 'John Smith', cpf: '12345678902', cnh: '12345678955'
    assert driver.save
  end

  test 'should delete driver' do
  	user = User.new  cpf: '12345678', email: 'es@es.com', kind: 'ADM', password: '123456', password_confirmation: '123456'
    user.save
    driver = Driver.new name: 'driver test', cpf: '12345678902', cnh: '12345678955'
    assert driver.save
    assert driver.delete 
  end

  test 'should not save driver with cpf violating format' do
  	user = User.new  cpf: '12345678', email: 'es@es.com', kind: 'ADM', password: '123456', password_confirmation: '123456'
    user.save
    driver = Driver.new name: 'driver test', cpf: 'a1211v3313', cnh: '12345678955'
    assert_not driver.save
  end
end
