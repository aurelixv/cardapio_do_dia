# == Schema Information
#
# Table name: bookings
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#  item_id    :bigint(8)
#

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item
end
