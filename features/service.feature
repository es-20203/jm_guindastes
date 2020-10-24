Feature:  service
    As an JM-TruckS's manager
    I want to create, edit and delete a service with cpf_cnpj, name, adress
    so that i can manipulate this service data 

    Scenario: create service
        Given I am logged in as user with cpf '123456789201', kind 'ADM' and password '1234567'
        And the vehicle with board '123456', category 'Truck', status 'Unavailable' exist
        And the driver with name 'Joao Eduardo Silva', cpf '71246880431', cnh '27341188802' exist
        And the client cpf_cnpj '05570176454', name 'Marcos Souto', email 'marcos@gmail.com', phone '12344321', street: 'Rua Aaa', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns' exists
	    And i am on the service's create page
        When i fill status 'On hold'  price '40.45' data '2020-10-11 03:52:11.076088' client 'Marcos Souto' driver 'Joao Eduardo Silva' vehicle '123456' street: 'Rua Aaa', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns'   
        And i click create service
        Then i see a message that service with data '2020-10-11 03:52:11 UTC' was created

    Scenario: edit service
        Given I am logged in as user with cpf '123456789201', kind 'ADM' and password '1234567'
        And the vehicle with board '123456', category 'Truck', status 'Unavailable' exist
        And the driver with name 'Joao Eduardo Silva', cpf '71246880431', cnh '27341188802' exist
        And the client cpf_cnpj '05570176454', name 'Marcos Souto', email 'marcos@gmail.com', phone '12344321', street: 'Rua Aaa', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns' exists
        And the service with status 'On hold'  price '40.45' data '2020-10-11 03:52:11.076088' client 'Marcos Souto' driver 'Joao Eduardo Silva' vehicle '123456' street: 'Rua Aaa', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns' exists
        When i am on the service's edit page with the data is '2020-10-11 03:52:11 UTC'
        And i fill status 'Concluded'  price '40.45' data '2020-10-11 03:52:11.076088' client 'Marcos Souto' driver 'Joao Eduardo Silva' vehicle '123456' street: 'Rua Aaa', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns'    
        And i click edit service
        Then i see a message that service with data '2020-10-11 03:52:11 UTC' was edited

    Scenario: create service with blank street
        Given I am logged in as user with cpf '123456789201', kind 'ADM' and password '1234567'
        And the vehicle with board '123456', category 'Truck', status 'Unavailable' exist
        And the driver with name 'Joao Eduardo Silva', cpf '71246880431', cnh '27341188802' exist
        And the client cpf_cnpj '05570176454', name 'Marcos Souto', email 'marcos@gmail.com', phone '12344321', street: 'Rua Aaa', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns' exists
	    And i am on the service's create page
        When i fill status 'On hold'  price '40.45' data '2020-10-11 03:52:11.076088' client 'Marcos Souto' driver 'Joao Eduardo Silva' vehicle '123456' street: '', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns'   
        And i click create service
        Then i see a service invalid message
  
    Scenario: create service with not numeric price
        Given I am logged in as user with cpf '123456789201', kind 'ADM' and password '1234567'
        And the vehicle with board '123456', category 'Truck', status 'Unavailable' exist
        And the driver with name 'Joao Eduardo Silva', cpf '71246880431', cnh '27341188802' exist
        And the client cpf_cnpj '05570176454', name 'Marcos Souto', email 'marcos@gmail.com', phone '12344321', street: 'Rua Aaa', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns' exists
	    And i am on the service's create page
        When i fill status 'On hold'  price '45a' data '2020-10-11 03:52:11.076088' client 'Marcos Souto' driver 'Joao Eduardo Silva' vehicle '123456' street: 'Rua Aaa', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns'   
        And i click create service
        Then i see a service invalid message

    Scenario: create service with negative price
        Given I am logged in as user with cpf '123456789201', kind 'ADM' and password '1234567'
        And the vehicle with board '123456', category 'Truck', status 'Unavailable' exist
        And the driver with name 'Joao Eduardo Silva', cpf '71246880431', cnh '27341188802' exist
        And the client cpf_cnpj '05570176454', name 'Marcos Souto', email 'marcos@gmail.com', phone '12344321', street: 'Rua Aaa', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns' exists
        And i am on the service's create page
        When i fill status 'On hold'  price '-45.24' data '2020-10-11 03:52:11.076088' client 'Marcos Souto' driver 'Joao Eduardo Silva' vehicle '123456' street: 'Rua Aaa', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns'   
        And i click create service
        Then i see a service invalid message    