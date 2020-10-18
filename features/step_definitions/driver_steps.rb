And ("i am on the driver's create page") do
    visit "/drivers/new"
    expect(page).to have_current_path('/drivers/new')
end

When('i fill name {string}, cpf {string}, cnh {string}') do |name, cpf, cnh|  
    fill_in 'driver[name]', :with => name
    fill_in 'driver[cpf]', :with => cpf
    fill_in 'driver[cnh]', :with => cnh
end

Then("i see a message that driver with cpf {string} was created") do |cpf|
    expect(page).to have_content(cpf)
end

And("the driver with name {string}, cpf {string}, cnh {string} exist") do |name, cpf, cnh|  
    visit "/drivers/new"
    expect(page).to have_current_path('/drivers/new')
    fill_in 'driver[name]', :with => name
    fill_in 'driver[cpf]', :with => cpf
    fill_in 'driver[cnh]', :with => cnh
    click_button 'commit'
end

When("i am on the driver's edit page with the cpf is {string}") do |cpf|
    visit '/drivers'
    click_link "e-#{cpf}"
end

Then("i see a message that driver with cpf {string} was edited") do |cpf|
    expect(page).to have_content(cpf) 
end

Then("i see a driver invalid message") do 
    expect(page).to have_content("1 error prohibited this driver from being saved:")      
end

And ('i click create driver') do
    click_button 'commit'
end

And ('i click edit driver') do
    click_button 'commit'
end