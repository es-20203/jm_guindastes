require 'test_helper'

class ServiceTest < ActiveSupport::TestCase

    test 'should save Service' do
        address = Address.new  street: 'A', neighborhood: 'downtown', number: '45', city: 'Garanhuns', zipcode: '55294123'
        address.save
        
        vehicle = Vehicle.new  category: 'crane', board: '1234567', status: 'available'
        vehicle.save

        driver = Driver.new  name: 'John Smith', cpf: '12345678902', cnh: '12345678955'
        driver.save

        client = Client.new cpf_cnpj: '12345678901253', name:'Michael Carter', email:'michael@gmail.com', address_id: address.id
        client.save

        service = Service.new  status: "STARTED", price: '4512', data: '2020-10-11 03:52:11.076088', address_id: address.id , driver_id: driver.id, client_id: client.id, vehicle_id: vehicle.id
        assert service.save
    end

    test 'should edit Service' do
        address = Address.new  street: 'A', neighborhood: 'downtown', number: '45', city: 'Garanhuns', zipcode: '55294123'
        address.save
        
        vehicle = Vehicle.new  category: 'crane', board: '1234567', status: 'available'
        vehicle.save

        driver = Driver.new  name: 'John Smith', cpf: '12345678902', cnh: '12345678955'
        driver.save

        client = Client.new cpf_cnpj: '12345678901253', name:'Michael Carter', email:'michael@gmail.com', address_id: address.id
        client.save

        service = Service.new  status: 'STARTED', price: '4512', data: '2020-10-11 03:52:11.076088', address_id: address.id , driver_id: driver.id, client_id: client.id, vehicle_id: vehicle.id
        service.save
        assert service.update status: 'FINISHED'
    end

    test 'should delete Service' do
        address = Address.new  street: 'A', neighborhood: 'downtown', number: '45', city: 'Garanhuns', zipcode: '55294123'
        address.save
        
        vehicle = Vehicle.new  category: 'crane', board: '1234567', status: 'available'
        vehicle.save

        driver = Driver.new  name: 'John Smith', cpf: '12345678902', cnh: '12345678955'
        driver.save

        client = Client.new cpf_cnpj: '12345678901253', name:'Michael Carter', email:'michael@gmail.com', address_id: address.id
        client.save

        service = Service.new  status: "STARTED", price: '4512', data: '2020-10-11 03:52:11.076088', address_id: address.id , driver_id: driver.id, client_id: client.id, vehicle_id: vehicle.id
        service.save
        assert service.delete
    end

    test 'should not save Service without client' do
        address = Address.new  street: 'A', neighborhood: 'downtown', number: '45', city: 'Garanhuns', zipcode: '55294123'
        address.save
        
        vehicle = Vehicle.new  category: 'crane', board: '1234567', status: 'available'
        vehicle.save

        driver = Driver.new  name: 'John Smith', cpf: '12345678902', cnh: '12345678955'
        driver.save

        service = Service.new  status: "STARTED", price: '4512', data: '2020-10-11 03:52:11.076088', address_id: address.id , driver_id: driver.id,  vehicle_id: vehicle.id
        assert_not service.save
    end

    test 'should not save Service without status' do
        address = Address.new  street: 'A', neighborhood: 'downtown', number: '45', city: 'Garanhuns', zipcode: '55294123'
        address.save
        
        vehicle = Vehicle.new  category: 'crane', board: '1234567', status: 'available'
        vehicle.save

        driver = Driver.new  name: 'John Smith', cpf: '12345678902', cnh: '12345678955'
        driver.save

        client = Client.new cpf_cnpj: '12345678901253', name:'Michael Carter', email:'michael@gmail.com', address_id: address.id
        client.save

        service = Service.new price: '4512', data: '2020-10-11 03:52:11.076088', address_id: address.id , driver_id: driver.id, client_id: client.id, vehicle_id: vehicle.id
        assert_not service.save
    end

    test 'should not save Service without driver' do
        address = Address.new  street: 'A', neighborhood: 'downtown', number: '45', city: 'Garanhuns', zipcode: '55294123'
        address.save
        
        vehicle = Vehicle.new  category: 'crane', board: '1234567', status: 'available'
        vehicle.save

        client = Client.new cpf_cnpj: '12345678901253', name:'Michael Carter', email:'michael@gmail.com', address_id: address.id
        client.save

        service = Service.new  status: "STARTED", price: '4512', data: '2020-10-11 03:52:11.076088', address_id: address.id , client_id: client.id, vehicle_id: vehicle.id
        assert_not service.save
    end

end
