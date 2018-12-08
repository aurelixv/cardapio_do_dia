# == Schema Information
#
# Table name: items
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  menu_id     :bigint(8)
#  dish_date   :date
#

class Item < ApplicationRecord
  belongs_to :menu
end
