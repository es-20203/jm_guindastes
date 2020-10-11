require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
   test 'should not save Service without client' do
    user = User.new  cpf: '12345678', email: 'es@es.com', kind: 'ADM', password: '123456', password_confirmation: '123456'
    user.save
    
    address = Address.new  street: 'Rua A', neighborhood: 'centro', number: '45', city: 'Garanhuns', zipcode: '55294123'
    address.save
    
    vehicle = Vehicle.new  category: 'crane', board: '1234567', status: 'available'
    vehicle.save

    driver = Driver.new  name: 'John Smith', cpf: '12345678902', cnh: '12345678955'
    driver.save

    service = Service.new  status: "STARTED", price: '4512', data: '2020-10-11 03:52:11.076088', address_id: address.id , driver_id: driver.id,  vehicle_id: vehicle.id
    assert_not service.save
  end

  test 'should save Service' do
    user = User.new  cpf: '12345678', email: 'es@es.com', kind: 'ADM', password: '123456', password_confirmation: '123456'
    user.save
    
    address = Address.new  street: 'Rua A', neighborhood: 'centro', number: '45', city: 'Garanhuns', zipcode: '55294123'
    address.save
    
    vehicle = Vehicle.new  category: 'crane', board: '1234567', status: 'available'
    vehicle.save

    driver = Driver.new  name: 'John Smith', cpf: '12345678902', cnh: '12345678955'
    driver.save

    client = Client.new cpf_cnpj: '12345678901253', name:'Paulo silva', email:'paulo@gmai.com', address_id: address.id
    client.save

    service = Service.new  status: "STARTED", price: '4512', data: '2020-10-11 03:52:11.076088', address_id: address.id , driver_id: driver.id, client_id: client.id, vehicle_id: vehicle.id
    assert service.save
  end

  test 'should not save Service without status' do
    user = User.new  cpf: '12345678', email: 'es@es.com', kind: 'ADM', password: '123456', password_confirmation: '123456'
    user.save
    
    address = Address.new  street: 'Rua A', neighborhood: 'centro', number: '45', city: 'Garanhuns', zipcode: '55294123'
    address.save
    
    vehicle = Vehicle.new  category: 'crane', board: '1234567', status: 'available'
    vehicle.save

    driver = Driver.new  name: 'John Smith', cpf: '12345678902', cnh: '12345678955'
    driver.save

    client = Client.new cpf_cnpj: '12345678901253', name:'Paulo silva', email:'paulo@gmai.com', address_id: address.id
    client.save

    service = Service.new price: '4512', data: '2020-10-11 03:52:11.076088', address_id: address.id , driver_id: driver.id, client_id: client.id, vehicle_id: vehicle.id
    assert_not service.save
   end

end
