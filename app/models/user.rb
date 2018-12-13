# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  name                   :string
#  telephone              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  restaurant_id          :bigint(8)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :restaurant, optional: true

  has_one :employee
  has_one :manager
  has_one :admin
  
  has_many :bookings
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
end
