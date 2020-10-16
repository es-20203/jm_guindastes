require 'test_helper'

class DriverTest < ActiveSupport::TestCase

  test 'should save driver with name, cpf and cnh' do
    driver = Driver.new name: 'John Smith', cpf: '12345678902', cnh: '12345678955'
    assert driver.save
  end

  test 'should delete driver' do
    driver = Driver.new name: 'John Smith', cpf: '12345678902', cnh: '12345678955'
    driver.save
    assert driver.delete 
  end

  test 'should edit driver' do
    driver = Driver.new name: 'John Smith', cpf: '12345678902', cnh: '12345678955'
    driver.save
    assert driver.update name: 'John Taylor Smith'
  end

  test 'should not save driver with cpf violating format' do
    driver = Driver.new name: 'John Smith', cpf: 'a1211v3313', cnh: '12345678955'
    assert_not driver.save
  end

  test 'should not edit driver with cpf violating maximum length' do
    driver = Driver.new name: 'John Smith', cpf: '12345678902', cnh: '12345678955'
    driver.save
    assert_not driver.update cpf: '443654312113313'
  end

  test 'should not save driver with cnh violating format' do
    driver = Driver.new name: 'John Smith', cpf: '11313193833', cnh: '12345678asa'
    assert_not driver.save
  end

end
