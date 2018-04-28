# == Schema Information
#
# Table name: modifiers
#
#  id          :bigint(8)        not null, primary key
#  description :text
#  name        :text
#  percent     :integer
#  start       :date
#  stop        :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Modifier < ApplicationRecord
  has_many :reservations
end
