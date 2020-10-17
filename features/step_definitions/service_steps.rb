And("i am on the service's create page") do 
    visit "/services/new"
    expect(page).to have_current_path('/services/new')
end

When('i fill status {string}  price {string} data {string} client {string} driver {string} vehicle {string} street: {string}, neighborhood: {string}, number: {string}, zipcode: {string}, city: {string}') do |status, price, data, client, driver, vehicle, street, neighborhood, number, zipcode, city|
    fill_in 'service[status]', :with => status
    fill_in 'service[price]', :with => price
    fill_in 'service[data]', :with => data
    select client, :from => 'service[client_id]'
    select driver, :from => 'service[driver_id]'
    select vehicle, :from => 'service[vehicle_id]'
    fill_in 'service[street]', :with => street
    fill_in 'service[neighborhood]', :with => neighborhood
    fill_in 'service[number]', :with => number
    fill_in 'service[zipcode]', :with => zipcode
    fill_in 'service[city]', :with => city
end

Then("i see a created service message") do
    expect(page).to have_content("Service was successfully created.")
end

And('the service with status {string}  price {string} data {string} client {string} driver {string} vehicle {string} street: {string}, neighborhood: {string}, number: {string}, zipcode: {string}, city: {string} exists') do |status, price, data, client, driver, vehicle, street, neighborhood, number, zipcode, city|
    visit "/services/new"
    expect(page).to have_current_path('/services/new')
    fill_in 'service[status]', :with => status
    fill_in 'service[price]', :with => price
    fill_in 'service[data]', :with => data
    select client, :from => 'service[client_id]'
    select driver, :from => 'service[driver_id]'
    select vehicle, :from => 'service[vehicle_id]'
    fill_in 'service[street]', :with => street
    fill_in 'service[neighborhood]', :with => neighborhood
    fill_in 'service[number]', :with => number
    fill_in 'service[zipcode]', :with => zipcode
    fill_in 'service[city]', :with => city
    click_button 'commit'
end

When("i am on the service's edit page with the data is {string}") do |data| 
    visit '/services'
    click_link "e-#{data}"
end

Then('i see a updated service message') do 
    expect(page).to have_content("Service was successfully updated.")
end

Then("i see a service invalid message") do 
    expect(page).to have_content("1 error prohibited this service from being saved:")      
end