# == Schema Information
#
# Table name: rooms
#
#  id          :bigint(8)        not null, primary key
#  description :text
#  name        :string
#  photos      :string           is an Array
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Room < ApplicationRecord
end
