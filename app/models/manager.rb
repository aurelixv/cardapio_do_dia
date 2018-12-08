# == Schema Information
#
# Table name: managers
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#

class Manager < ApplicationRecord
  belongs_to :user
  has_one :restaurant
end
