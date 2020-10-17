require 'test_helper'

class AddressTest < ActiveSupport::TestCase

  test 'should save Address with street, neighborhood, number, city, zipcode' do
    address = Address.new  street: 'A', neighborhood: 'downtown', number: '45', city: 'Garanhuns', zipcode: '55294123'
    assert address.save
  end

  test 'should update Address' do
    address = Address.new  street: 'A', neighborhood: 'downtown', number: '45', city: 'Garanhuns', zipcode: '55294123'
    address.save
    assert address.update street: 'Rua John'
  end

   test 'should delete Address' do
    address = Address.new  street: 'A', neighborhood: 'downtown', number: '45', city: 'Garanhuns', zipcode: '55294123'
    address.save
    assert address.delete
  end

  test 'should not save Address without street' do
    address = Address.new  neighborhood: 'downtown', number: '45', city: 'Garanhuns', zipcode: '55294123'
    assert_not address.save 
  end

  test 'should not save Address with zipcode violating format' do
    address = Address.new  street: 'A', neighborhood: 'downtown', number: '45', city: 'Garanhuns', zipcode: '552941ax'
    assert_not address.save 
  end

  test 'should not save Address with zipcode violating maximum length' do
    address = Address.new  street: 'A', neighborhood: 'downtown', number: '45', city: 'Garanhuns', zipcode: '5529411233444'
    assert_not address.save 
  end

end
