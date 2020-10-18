Feature:  driver
    As an JM-GUINDASTES's ADM
    I want to create, edit and delete a driver with name, cpf, cnh
    so that i can manipulate this driver data 

    Scenario: create driver
        Given I am logged in as user with cpf '05570176454', kind 'ADM' and password '1234567'
        And i am on the driver's create page
        When i fill name 'Joao Eduardo Silva', cpf '71246880431', cnh '27341188802'  
        And i click create driver
        Then i see a message that driver with cpf '71246880431' was created

    Scenario: edit driver
        Given I am logged in as user with cpf '05570176454', kind 'ADM' and password '1234567'
        And the driver with name 'Joao Eduardo Silva', cpf '71246880431', cnh '27341188802' exist
        When i am on the driver's edit page with the cpf is '71246880431'
        And i fill name 'Paulo Eduardo Silva', cpf '71246880431', cnh '27341188802'
        And i click edit driver
        Then i see a message that driver with cpf '71246880431' was edited

    Scenario: edit driver when name size is smaller then 7
        Given I am logged in as user with cpf '05570176454', kind 'ADM' and password '1234567'
        And the driver with name 'Joao Eduardo Silva', cpf '71246880431', cnh '27341188802' exist
        When i am on the driver's edit page with the cpf is '71246880431'
        And i fill name 'Paulo', cpf '71246880431', cnh '27341188802'
        And i click edit driver
        Then i see a driver invalid message
    
    Scenario: create driver with cpf not numeric
        Given I am logged in as user with cpf '05570176454', kind 'ADM' and password '1234567'
        And i am on the driver's create page
        When i fill name 'Joao Eduardo Silva', cpf '7124688A431', cnh '27341188802'  
        And i click create driver
        Then i see a driver invalid message 

    Scenario: create driver with blank cpf bigger then 11
        Given I am logged in as user with cpf '05570176454', kind 'ADM' and password '1234567'
        And i am on the driver's create page
        When i fill name 'Joao Paulo Eduardo Silva', cpf '712468804312', cnh '27341188802'  
        And i click create driver
        Then i see a driver invalid message  