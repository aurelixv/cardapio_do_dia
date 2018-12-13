# == Schema Information
#
# Table name: employees
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#

class Employee < ApplicationRecord
  belongs_to :user
end
