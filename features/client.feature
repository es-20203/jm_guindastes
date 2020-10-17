Feature:  client
    As an JM-GUINDASTES's manager
    I want to create, edit and delete a client with cpf_cnpj, name, adress
    so that i can manipulate this client data 

    Scenario: create client
        Given I am logged in as user with cpf '123456789201', kind 'ADM' and password '1234567'
	    And i am on the client's create page
        When i fill  cpf_cnpj '05570176454', name 'Marcos Souto', email 'marcos@gmail.com', phone '12344321', street: 'Rua Aaa', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns'   
        And i click create
        Then i see a created client message

    Scenario: edit client
        Given I am logged in as user with cpf '123456789201', kind 'ADM' and password '1234567'
        And the client cpf_cnpj '05570176454', name 'Marcos Souto', email 'marcos@gmail.com', phone '12344321', street: 'Rua Aaa', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns' exists
        When i am on the client's edit page with the cpf_cnpj is '05570176454'
        And i fill  cpf_cnpj '123456789101', name 'Marcos Souto', email 'marcos@gmail.com', phone '12344321', street: 'Rua Aaa', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns'   
        And i click edit
        Then i see a updated client message

    Scenario: edit client when cpf_cnpj size is smaller then 11
        Given I am logged in as user with cpf '123456789201', kind 'ADM' and password '1234567'
        And the client cpf_cnpj '05570176454', name 'Marcos Souto', email 'marcos@gmail.com', phone '12344321', street: 'Rua Aaa', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns' exists
        When i am on the client's edit page with the cpf_cnpj is '05570176454'
        And i fill  cpf_cnpj '123', name 'Marcos Souto', email 'marcos@gmail.com', phone '12344321', street: 'Rua Aaa', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns'   
        And i click edit
        Then i see a client invalid message
    
    Scenario: edit client when cpf_cnpj size is bigger then 14
        Given I am logged in as user with cpf '123456789201', kind 'ADM' and password '1234567'
        And the client cpf_cnpj '05570176454', name 'Marcos Souto', email 'marcos@gmail.com', phone '12344321', street: 'Rua Aaa', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns' exists
        When i am on the client's edit page with the cpf_cnpj is '05570176454'
        And i fill  cpf_cnpj '12345678901101010', name 'Marcos Souto', email 'marcos@gmail.com', phone '12344321', street: 'Rua Aaa', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns'   
        And i click edit
        Then i see a client invalid message
    

    Scenario: create client with cpf_cnpj violating format
        Given I am logged in as user with cpf '123456789201', kind 'ADM' and password '1234567'
	    And i am on the client's create page
       	When i fill  cpf_cnpj '123456789A2', name 'Marcos Souto', email 'marcos@gmail.com', phone '12344321', street: 'Rua Aaa', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns'   
        And i click create
        Then i see a client invalid message 

    Scenario: create client with size is smaller then 10
        Given I am logged in as user with cpf '123456789201', kind 'ADM' and password '1234567'
	    And i am on the client's create page
       	When i fill  cpf_cnpj '05570176454', name 'Marcos', email 'marcos@gmail.com', phone '12344321', street: 'Rua Aaa', neighborhood: 'Centro', number: '78', zipcode: '12345678', city: 'garanhuns'   
        And i click create
        Then i see a client invalid message 