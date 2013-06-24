class Event < ActiveRecord::Base
  belongs_to :address, class_name: 'Addresss', dependent: :destroy
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

