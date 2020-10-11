require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test 'should save client with cpf_cnpj, name, email, phone_number and address' do
  	user = User.new  cpf: '12345678910', email: 'es@es.com', kind: 'Driver', password: '123456', password_confirmation: '123456'
    user.save
    address = Address.new  street: 'Rua A', neighborhood: 'centro', number: '45', city: 'Garanhuns', zipcode: '55294123'
    address.save
    client = Client.new cpf_cnpj: '12345678901253', name:'Paulo silva', email:'paulo@gmail.com', address_id: address.id
    assert client.save
  end

  test 'should edit email client' do
  	user = User.new  cpf: '12345678910', email: 'es@es.com', kind: 'Driver', password: '123456', password_confirmation: '123456'
    user.save
    address = Address.new  street: 'Rua A', neighborhood: 'centro', number: '45', city: 'Garanhuns', zipcode: '55294123'
    address.save
    client = Client.new cpf_cnpj: '12345678901253', name:'Paulo silva', email:'paulo@gmai.com', address_id: address.id
    client.save
    assert client.update email: 'paulo@gmail.com'
  end

  test 'should not client user with name violating minimum length ' do
  	user = User.new  cpf: '12345678910', email: 'es@es.com', kind: 'Driver', password: '123456', password_confirmation: '123456'
    user.save
    address = Address.new  street: 'Rua A', neighborhood: 'centro', number: '45', city: 'Garanhuns', zipcode: '55294123'
    address.save
    client = Client.new cpf_cnpj: '12345678901AA', name:'Paulo silva', email:'paulo@gmai.com', address_id: address.id
    client.save
    assert_not client.update name: 'Paulo'
  end

  test 'should not edit client with cpf_cnpj violating format' do
  	user = User.new  cpf: '12345678910', email: 'es@es.com', kind: 'Driver', password: '123456', password_confirmation: '123456'
    user.save
    address = Address.new  street: 'Rua A', neighborhood: 'centro', number: '45', city: 'Garanhuns', zipcode: '55294123'
    address.save
    client = Client.new cpf_cnpj: '123456789012', name:'Paulo silva', email:'paulo@gmail.com', address_id: address.id
    client.save
    assert_not client.update cpf_cnpj: '2335s3dededed'
  end

end
