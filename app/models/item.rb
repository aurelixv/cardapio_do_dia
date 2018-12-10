# == Schema Information
#
# Table name: items
#
#  id                    :bigint(8)        not null, primary key
#  name                  :string
#  description           :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  dish_date             :date
#  restaurant_id         :bigint(8)
#  food_type             :string
#  price                 :float
#  restaurant_menu_id_id :bigint(8)
#

class Item < ApplicationRecord
  belongs_to :restaurant
  belongs_to :restaurant_menu, optional: :true

  validates :restaurant_id, presence: :true
end
