# == Schema Information
#
# Table name: restaurants
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  manager_id  :bigint(8)
#  telephone   :string
#  email       :string
#  address     :string
#  food_type   :string
#

class Restaurant < ApplicationRecord
  has_many :employees
  has_many :items
  has_many :restaurant_menus
  belongs_to :manager

  validates :name, presence: :true
end
