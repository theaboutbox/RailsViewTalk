require 'spec_helper'

describe User do
  it "Fabricates a valid user" do
    expect(Fabricate(:user_with_profile)).to be_valid
  end

  it "Transitions States" do
    user = Fabricate(:user_with_profile)
    expect(user.registration_state_name).to eq :initial
    user.next_state
    expect(user.registration_state_name).to eq :address
    user.next_state
    expect(user.registration_state_name).to eq :non_profit
    user.next_state
    expect(user.registration_state_name).to eq :event
    user.next_state
    expect(user.registration_state_name).to eq :registered
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string(255)      not null
#  last_name              :string(255)      not null
#  gender                 :string(1)
#  date_of_birth          :date
#  email                  :string(255)      not null
#  phone                  :string(255)
#  employer_name          :string(255)
#  event_id               :integer
#  non_profit_id          :integer
#  encrypted_password     :string(255)      not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  home_address_id        :integer
#  work_address_id        :integer
#  slug                   :string(255)      not null
#  accepted_terms_at      :datetime
#  admin                  :boolean
#  registration_state     :string(255)      default("initial"), not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#

