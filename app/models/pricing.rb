# frozen_string_literal: true

# == Schema Information
#
# Table name: pricings
#
#  id          :bigint(8)        not null, primary key
#  description :text
#  name        :text
#  price_cents :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Pricing < ApplicationRecord
  monetize :price_cents
end
