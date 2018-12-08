# == Schema Information
#
# Table name: restaurants
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  manager_id  :bigint(8)
#

class Restaurant < ApplicationRecord
  has_many :employees
  belongs_to :manager
  has_many :menus
end
