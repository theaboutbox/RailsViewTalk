Fabricator(:event) do
  name { Faker::Company.name }
  url  { Faker::Internet.url }
  notes { Faker::Lorem.paragraphs(3).join("\n") }
end

Fabricator(:event_with_info, from: :event) do
  date { 1.week.from_now }
  contact_address(fabricator: :address)
  event_address(fabricator: :address)
  sport { 'curling' }
  notes { Faker::Lorem.paragraphs(3).join("\n") }
end
