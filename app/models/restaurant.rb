# == Schema Information
#
# Table name: restaurants
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  telephone   :string
#  email       :string
#  address     :string
#  food_type   :string
#  manager_id  :integer
#

class Restaurant < ApplicationRecord
  has_many :users
  has_many :items
  has_many :restaurant_menus

  belongs_to :manager, foreign_key: "manager_id"

  validates :name, presence: :true
end
