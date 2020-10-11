require 'test_helper'

class AddressTest < ActiveSupport::TestCase
   test 'should save Address with street, neighborhood, number, city, zipcode' do
    user = User.new  cpf: '12345678', email: 'es@es.com', kind: 'ADM', password: '123456', password_confirmation: '123456'
    user.save
    address = Address.new  street: 'Rua A', neighborhood: 'centro', number: '45', city: 'Garanhuns', zipcode: '55294123'
    assert address.save
  end

  test 'should update Address' do
    user = User.new  cpf: '12345678', email: 'es@es.com', kind: 'ADM', password: '123456', password_confirmation: '123456'
    user.save
    address = Address.new  street: 'Rua A', neighborhood: 'centro', number: '45', city: 'Garanhuns', zipcode: '55294123'
    assert address.save
    assert address.update street: 'Rua John'
  end

  test 'should not save Address without street' do
    user = User.new  cpf: '12345678', email: 'es@es.com', kind: 'ADM', password: '123456', password_confirmation: '123456'
    user.save
    address = Address.new  street: '', neighborhood: 'centro', number: '45', city: 'Garanhuns', zipcode: '55294123'
    assert_not address.save 
  end
end
