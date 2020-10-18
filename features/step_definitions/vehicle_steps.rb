Given('I am logged in as user with cpf {string}, kind {string} and password {string}') do |cpf, kind, password|
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

And ('i click create vehicle') do
    click_button 'commit'
end

Then('i see a message that vehicle with board {string} was created') do |board|
    expect(page).to have_content(board)
end

When ("i am on the vehicle's edit page with the board is {string}") do |board|
    visit '/vehicles'
    click_link "e-#{board}"
end

And ('i click edit vehicle') do
    click_button 'commit'
end

Then("i see a message that vehicle with board {string} was edited") do |board|
    expect(page).to have_content(board)
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
