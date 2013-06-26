Fabricator(:address) do
  street { "12345 Main Street" }
  city { "Denver" }
  region { "CO" }
  post_code { 12345 }
  country { "United States" }
end

# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  street     :string(255)
#  suite      :string(255)
#  city       :string(255)
#  region     :string(255)
#  post_code  :string(255)
#  country    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

