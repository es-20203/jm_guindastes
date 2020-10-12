require 'test_helper'

class DriverTest < ActiveSupport::TestCase
  test 'should save driver with name, cpf and cnh' do
    driver = Driver.new name: 'John Smith', cpf: '12345678902', cnh: '12345678955'
    assert driver.save
  end

  test 'should delete driver' do
    driver = Driver.new name: 'John Smith', cpf: '12345678902', cnh: '12345678955'
    assert driver.save
    assert driver.delete 
  end

  test 'should not save driver with cpf violating format' do
    driver = Driver.new name: 'John Smith', cpf: 'a1211v3313', cnh: '12345678955'
    assert_not driver.save
  end
end
