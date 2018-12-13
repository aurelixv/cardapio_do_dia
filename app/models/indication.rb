# == Schema Information
#
# Table name: indications
#
#  id               :bigint(8)        not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint(8)
#  item_id          :bigint(8)
#  destination_user :integer
#

class Indication < ApplicationRecord
end
