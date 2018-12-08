# == Schema Information
#
# Table name: menus
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :bigint(8)
#

class Menu < ApplicationRecord
  has_many :items
  belongs_to :restaurant
end
