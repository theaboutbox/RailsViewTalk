Fabricator(:non_profit) do
  name { Faker::Company.name  }
  url  { Faker::Internet.url  }
  description { Faker::Lorem.paragraphs(3).join("\n") }
end

Fabricator(:non_profit_with_info, from: :non_profit) do
  tax_id { SecureRandom.random_number(1000000) }
  description { Faker::Lorem.paragraphs(2).join("\n") }
end
