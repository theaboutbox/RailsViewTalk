class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :display_name, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :work_address, class_name: 'Address', dependent: :destroy
  belongs_to :home_address, class_name: 'Address', dependent: :destroy
  belongs_to :event
  belongs_to :non_profit

  accepts_nested_attributes_for :home_address, :work_address

  validates_presence_of :first_name, :last_name, :email

  # [Public] The full, displayable name for a user.
  #
  # Example, if the first_name is "Testy" and the last name is "Tester"
  # then this method returns: "Testy Tester"
  #
  # Returns String display name for this user 
  def display_name
    "#{first_name} #{last_name}"
  end

  state_machine :registration_state, :initial => :initial do
    event :next_state do
      transition :initial => :address
      transition :address => :non_profit
      transition :non_profit => :event
      transition :event => :registered
    end

    state :non_profit, :event, :registered do
      validates_presence_of :home_address, :work_address
    end

    state :event, :registered do
      validates_presence_of :non_profit
    end

    state :registered do
      validates_presence_of :event
    end
  end

  def last_step?
    registration_state_name == :event
  end

  def complete?
    registration_state_name == :registered
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

