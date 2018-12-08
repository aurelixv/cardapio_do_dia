class Restaurant < ApplicationRecord
  has_many :employees
  belongs_to :manager
  has_many :menus
end
