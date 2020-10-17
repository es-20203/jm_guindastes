require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  
  test 'should save client with cpf_cnpj, name, email and address' do
    address = Address.new  street: 'Rua A', neighborhood: 'centro', number: '45', city: 'Garanhuns', zipcode: '55294123'
    address.save
    client = Client.new cpf_cnpj: '12345678901253', name:'Paulo silva', email:'paulo@gmail.com', address_id: address.id
    assert client.save
  end

  test 'should delete client' do
    address = Address.new  street: 'Rua A', neighborhood: 'centro', number: '45', city: 'Garanhuns', zipcode: '55294123'
    address.save
    client = Client.new cpf_cnpj: '12345678901253', name:'Paulo silva', email:'paulo@gmail.com', address_id: address.id
    client.save
    client.delete
  end

  test 'should edit email client' do
    address = Address.new  street: 'Rua A', neighborhood: 'centro', number: '45', city: 'Garanhuns', zipcode: '55294123'
    address.save
    client = Client.new cpf_cnpj: '12345678901253', name:'Paulo silva', email:'paulo@gmai.com', address_id: address.id
    client.save
    assert client.update email: 'paulo@gmail.com'
  end

  test 'should not client without cpf_cnpj' do
    address = Address.new  street: 'Rua A', neighborhood: 'centro', number: '45', city: 'Garanhuns', zipcode: '55294123'
    address.save
    client = Client.new name:'Paulo silva', email:'paulo@gmail.com', address_id: address.id
    assert_not client.save
  end

  test 'should not client user with name violating minimum length ' do
    address = Address.new  street: 'Rua A', neighborhood: 'centro', number: '45', city: 'Garanhuns', zipcode: '55294123'
    address.save
    client = Client.new cpf_cnpj: '1234567890134', name:'Paulo silva', email:'paulo@gmail.com', address_id: address.id
    client.save
    assert_not client.update name: 'Paulo'
  end

  test 'should not edit client with cpf_cnpj violating format' do
    address = Address.new  street: 'Rua A', neighborhood: 'centro', number: '45', city: 'Garanhuns', zipcode: '55294123'
    address.save
    client = Client.new cpf_cnpj: '123456789012', name:'Paulo silva', email:'paulo@gmail.com', address_id: address.id
    client.save
    assert_not client.update cpf_cnpj: '2335s3dededed'
  end

end
