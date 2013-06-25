Fabricator(:user) do
  first_name { Faker::Name.first_name }
  last_name  { Faker::Name.last_name  }
  email      { Faker::Internet.email }
  password { "test12345" }
  password_confirmation { "test12345" }
  accepted_terms_at { 1.minute.ago }
end

Fabricator(:user_with_addresses, from: :user) do
  home_address(fabricator: :address)
  work_address(fabricator: :address)
end

Fabricator(:user_with_profile, from: :user_with_addresses) do
  event(fabricator: :event)
  non_profit(fabricator: :non_profit)
  accepted_terms { true }
end
