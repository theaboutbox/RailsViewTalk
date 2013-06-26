Fabricator(:event) do
  name { Faker::Company.name }
  url  { Faker::Internet.url }
  description { Faker::Lorem.paragraphs(3).join("\n") }
end

Fabricator(:event_with_info, from: :event) do
  date { 1.week.from_now }
  contact_address(fabricator: :address)
  event_address(fabricator: :address)
  sport { 'curling' }
end

# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  date        :date
#  url         :string(255)      not null
#  sport       :string(255)
#  slug        :string(255)
#  description :text
#

