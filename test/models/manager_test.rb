# == Schema Information
#
# Table name: managers
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#

require 'test_helper'

class ManagerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
