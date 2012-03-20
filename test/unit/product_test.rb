# == Schema Information
#
# Table name: products
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  description :text
#  image_url   :string(255)
#  price       :decimal(8, 2)
#  author      :string(255)
#  publisher   :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
