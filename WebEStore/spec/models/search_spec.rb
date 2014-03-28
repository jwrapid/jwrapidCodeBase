# == Schema Information
#
# Table name: searches
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  category_id :integer
#  min_price   :decimal(, )
#  max_price   :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  code        :string(255)
#

require 'spec_helper'

describe Search do
  pending "add some examples to (or delete) #{__FILE__}"
end
