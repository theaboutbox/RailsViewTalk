class Address < ActiveRecord::Base
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

