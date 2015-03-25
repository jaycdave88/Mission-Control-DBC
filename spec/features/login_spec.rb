
require 'capybara/rspec'

feature "User can log into app" do

  scenario "on click user will be brought to login form" do

    visit root_path
    click_link 'Log In'
    expect(page).to have_button 'Log In'
  end

  xscenario "user can fill out form to log in" do
    user = User.create(name: "Bob", email: "bob@gmail.com", phase: '1', password: "ilovecookies")

    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    expect(page).to have_content("Home Page")
    expect(page).to have_content("Welcome, Bob!")
  end

end

feature "User can sign up for app" do
  xscenario "on click user will be brought to sign up form" do

    visit root_path
    click_link 'Sign Up'
    expect(page).to have_content 'Sign Up'
  end

  scenario "user fills out signup form to create new user" do
    user = User.create(name: "Bob", email: "bob@gmail.com", phase: '1', password: "ilovecookies")

    visit new_user_path
    fill_in "Name", with: user.name
    fill_in 'Email', with: user.email
    fill_in 'Phase', with: user.phase
    fill_in 'Password', with: user.password
    click_button 'Create User'
    expect(page).to have_content("Welcome, Bob!")
  end



end



