Given('I am logged in as user with cpf {string}, admin {string} and password {string}') do |cpf, kind, password|
    visit "/users/sign_up"
    expect(page).to have_current_path('/users/sign_up')
    fill_in 'user[cpf]', :with => cpf
    fill_in 'user[email]', :with => 'test@test.com'
    select kind, :from => 'user[kind]'
    fill_in 'user[password]', :with => password
    fill_in 'user[password_confirmation]', :with => password
    click_button 'commit'
end

And("i am on the vehicle's create page") do
    visit "/vehicles/new"
    expect(page).to have_current_path('/vehicles/new')
end

When('i fill board {string}, category {string}, status {string}') do |board, category, status|
    fill_in 'vehicle[board]', :with => board
    fill_in 'vehicle[category]', :with => category
    fill_in 'vehicle[status]', :with => status
end       

And ('i click create') do
    click_button 'commit'
end

Then('i see a created vehicle message') do
    expect(page).to have_content("Vehicle was successfully created.")
end

When ("i am on the vehicle's edit page with the board is {string}") do |board|
    visit '/vehicles'
    click_link "e-#{board}"
end

And("i click edit") do
    click_button 'commit'
end

Then("i see a updated vehicle message") do
    expect(page).to have_content("Vehicle was successfully updated.")
end
  
Then('i see a vehicle invalid message') do
    expect(page).to have_content("1 error prohibited this vehicle from being saved:")
end

And('the vehicle with board {string}, category {string}, status {string} exist') do |board, category, status|
    visit "/vehicles/new"
    fill_in 'vehicle[board]', :with => board
    fill_in 'vehicle[category]', :with => category
    fill_in 'vehicle[status]', :with => status
    click_button 'commit'
end
