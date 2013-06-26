class Event < ActiveRecord::Base
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

