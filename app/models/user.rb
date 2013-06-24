class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :display_name, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :work_address, class_name: 'Address', dependent: :destroy
  belongs_to :home_address, class_name: 'Address', dependent: :destroy
  belongs_to :event
  belongs_to :non_profit
 
  def display_name
    "#{first_name} #{last_name}"
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
#

