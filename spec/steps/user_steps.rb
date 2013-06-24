module UserSteps
  step "I go to the user registration page" do
    visit new_user_registration_path
  end

  step "I fill out my profile information" do
    fill_in 'user[first_name]', with: 'Test'
    fill_in 'user[last_name]', with: 'User'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'test12345'
    fill_in 'user[password_confirmation]', with: 'test12345'
    click_button 'Sign up'
  end

  step "it should create a new user" do
    u = User.find_by_email 'test@test.com'
    expect(u).to be_present
  end
end
