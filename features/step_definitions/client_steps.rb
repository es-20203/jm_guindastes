And ("i am on the client's create page") do
    visit "/clients/new"
    expect(page).to have_current_path('/clients/new')
end

When('i fill  cpf_cnpj {string}, name {string}, email {string}, phone {string}, street: {string}, neighborhood: {string}, number: {string}, zipcode: {string}, city: {string}') do |cpf_cnpj, name, email, phone, street, neighborhood, number, zipcode, city|  
    fill_in 'client[cpf_cnpj]', :with => cpf_cnpj
    fill_in 'client[name]', :with => name
    fill_in 'client[email]', :with => email
    fill_in 'client[phone_number]', :with => phone
    fill_in 'client[street]', :with => street
    fill_in 'client[neighborhood]', :with => neighborhood
    fill_in 'client[number]', :with => number
    fill_in 'client[zipcode]', :with => zipcode
    fill_in 'client[city]', :with => city
end

Then("i see a created client message") do
    expect(page).to have_content("Client was successfully created.")
end

And("the client cpf_cnpj {string}, name {string}, email {string}, phone {string}, street: {string}, neighborhood: {string}, number: {string}, zipcode: {string}, city: {string} exists") do |cpf_cnpj, name, email, phone, street, neighborhood, number, zipcode, city|  
    visit "/clients/new"
    fill_in 'client[cpf_cnpj]', :with => cpf_cnpj
    fill_in 'client[name]', :with => name
    fill_in 'client[email]', :with => email
    fill_in 'client[phone_number]', :with => phone
    fill_in 'client[street]', :with => street
    fill_in 'client[neighborhood]', :with => neighborhood
    fill_in 'client[number]', :with => number
    fill_in 'client[zipcode]', :with => zipcode
    fill_in 'client[city]', :with => city
    click_button 'commit'
end

When("i am on the client's edit page with the cpf_cnpj is {string}") do |cpf_cnpj|
    visit '/clients'
    click_link "e-#{cpf_cnpj}"
end

Then("i see a updated client message") do
    expect(page).to have_content("Client was successfully updated.") 
end

Then("i see a client invalid message") do 
    expect(page).to have_content("1 error prohibited this client from being saved:")      
end
