module EventSteps
  step "an event named :event_name" do |event_name|
    @event = Fabricate(:event, name: event_name)
  end

  step "I go to choose an event" do
    visit edit_account_event_path
  end

  step "I select event :event_name" do |event_name|
    choose event_name
    click_button 'Update User'
  end

  step "my event should be :event_name" do |event_name|
    expect(@user.reload.event.name).to eq event_name
  end
end
