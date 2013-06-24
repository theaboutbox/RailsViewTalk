class NonProfit < ActiveRecord::Base
end

# == Schema Information
#
# Table name: non_profits
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  tax_id      :string(255)
#  url         :string(255)      not null
#  slug        :string(255)
#  description :text
#  notes       :text
#

