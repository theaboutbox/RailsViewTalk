module UserSteps
  step "I go to the user registration page" do
    visit root_path
    click_link "[Register]"
  end

  step "I go to the next step" do
    click_button "Next >"
  end

  step "I fill out my profile information" do
    fill_in 'user[first_name]', with: 'Test'
    fill_in 'user[last_name]', with: 'User'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'test12345'
    fill_in 'user[password_confirmation]', with: 'test12345'
  end

  def fill_in_address(name)
    fill_in "user_#{name}_address_attributes_street", with: '12345 Test Street'
    fill_in "user_#{name}_address_attributes_city", with: "Testville"
    fill_in "user_#{name}_address_attributes_region", with: "CO"
    fill_in "user_#{name}_address_attributes_post_code", with: "12345"
    select "United States", from: "user_#{name}_address_attributes_country"
  end

  step "I fill out my home address" do
    fill_in_address "home"
  end

  step "I fill out my work address" do
    fill_in_address "work"
  end

  step "I submit the user registration form" do
    click_button 'Sign up'
  end

  step "I update the user" do
    click_button 'Update User'
  end

  step "it should create a new user" do
    u = User.find_by_email 'test@test.com'
    expect(u).to be_present
  end

  def sign_in_as(user)
    visit new_user_session_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: "test12345"
    click_button "Sign in"
  end

  step "I am logged in" do
    @user = Fabricate(:user_with_profile)
    sign_in_as @user
  end

  step "I am a user competing in the :event_name raising money for :non_profit_name" do |event_name, non_profit_name|
    @event = Fabricate(:event, name: event_name, description: "Event Description")
    @non_profit = Fabricate(:non_profit, name: non_profit_name, description: "Non Profit Description")
    @user = Fabricate(:user_with_profile, non_profit: @non_profit, event: @event)
    sign_in_as @user
  end

  step "I go to my fundraising page" do
    visit athlete_path(@user)
  end

  step "I should see my name" do
    expect(page.body).to include @user.display_name
  end

  step "I should see my non profit info" do
    expect(page.body).to include @user.non_profit.name
    expect(page.body).to include @user.non_profit.description
  end

  step "I should see my event info" do
    expect(page.body).to include @user.event.name
    expect(page.body).to include @user.event.description
  end

  step "I should be able to donate" do
    expect(page.body).to have_css('button.donate')
  end

  step "I should see that my profile is not complete" do
    expect(page.body).to include "Please come back later"
  end

end
