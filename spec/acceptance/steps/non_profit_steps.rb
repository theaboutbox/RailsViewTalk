module NonProfitSteps
  step "a non profit named :non_profit_name" do |non_profit_name|
    @non_profit = Fabricate(:non_profit, name: non_profit_name)
  end

  step "I go to choose a non profit" do
    visit root_path
    click_link "Change your Nonprofit"
  end

  step "I select non profit :non_profit_name" do |non_profit_name|
    select non_profit_name, from: 'user_non_profit_id'
    click_button "Update User"
  end

  step "my non profit should be :non_profit_name" do |non_profit_name|
    expect(@user.reload.non_profit.name).to eq non_profit_name
  end
end
