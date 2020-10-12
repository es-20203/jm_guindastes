require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test 'should save Address with street, neighborhood, number, city, zipcode' do
    address = Address.new  street: 'A', neighborhood: 'downtown', number: '45', city: 'Garanhuns', zipcode: '55294123'
    assert address.save
  end

  test 'should update Address' do
    address = Address.new  street: 'A', neighborhood: 'downtown', number: '45', city: 'Garanhuns', zipcode: '55294123'
    assert address.save
    assert address.update street: 'Rua John'
  end

  test 'should not save Address without street' do
    address = Address.new  street: '', neighborhood: 'downtown', number: '45', city: 'Garanhuns', zipcode: '55294123'
    assert_not address.save 
  end
end
