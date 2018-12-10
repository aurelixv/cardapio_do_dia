# == Schema Information
#
# Table name: likes
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :bigint(8)
#

class Like < ApplicationRecord
  belongs_to :item
  belongs_to :user
end
