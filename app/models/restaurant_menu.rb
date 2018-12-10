# == Schema Information
#
# Table name: restaurant_menus
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

class RestaurantMenu < ApplicationRecord
  belongs_to :restaurant
  has_many :items
end
