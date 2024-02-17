# == Schema Information
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  description :text
#  director    :string
#  name        :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
