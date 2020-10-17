
Feature:  vehicle
    As an JM-GUINDASTES's ADM
    I want to create, edit and delete a vehicle with board, category, status
    so that i can manipulate this vehicle data 

    Scenario: create vehicle
        Given I am logged in as user with cpf '05570176454', kind 'ADM' and password '1234567'
	    And i am on the vehicle's create page
        When i fill board '123456', category 'GUINDASTE', status 'EM USO'  
        And i click create
        Then i see a created vehicle message

    Scenario: edit vehicle
        Given I am logged in as user with cpf '05570176454', kind 'ADM' and password '1234567'
        And the vehicle with board '123456', category 'GUINDASTE', status 'EM USO' exist
        When i am on the vehicle's edit page with the board is '123456'
        And i fill board '7654321', category 'CAMINHAO', status 'EM USO'
        And i click edit
        Then i see a updated vehicle message

    Scenario: edit vehicle when board size is bigger then 7
        Given I am logged in as user with cpf '05570176454', kind 'ADM' and password '1234567'
        And the vehicle with board '123456', category 'GUINDASTE', status 'EM USO' exist
        When i am on the vehicle's edit page with the board is '123456'
        And i fill board '12345678', category 'CAMINHAO', status 'EM USO'
        And i click edit
        Then i see a vehicle invalid message
    
    Scenario: create vehicle with blank board
        Given I am logged in as user with cpf '05570176454', kind 'ADM' and password '1234567'
        And i am on the vehicle's create page
       	When i fill board '', category 'CAMINHAO', status 'EM USO'
        And i click create
        Then i see a vehicle invalid message 

    Scenario: create vehicle with blank category
        Given I am logged in as user with cpf '05570176454', kind 'ADM' and password '1234567'
        And i am on the vehicle's create page
       	When i fill board '1324', category '', status 'EM USO'
        And i click create
        Then i see a vehicle invalid message 