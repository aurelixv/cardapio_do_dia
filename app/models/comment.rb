# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment    :text
#  item_id    :bigint(8)
#  user_id    :bigint(8)
#

class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :comment, presence: :true
end
