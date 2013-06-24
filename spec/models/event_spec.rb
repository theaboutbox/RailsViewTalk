require 'spec_helper'

describe Event do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: events
#
#  id               :integer          not null, primary key
#  name             :string(255)      not null
#  date             :date
#  url              :string(255)      not null
#  event_address_id :integer
#  sport            :string(255)
#  notes            :text
#  slug             :string(255)
#

