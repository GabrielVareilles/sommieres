# frozen_string_literal: true

# == Schema Information
#
# Table name: rooms
#
#  id          :bigint(8)        not null, primary key
#  capacity    :integer
#  description :text
#  expositions :string           is an Array
#  name        :string
#  photos      :string           is an Array
#  status      :integer          default("disponible")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Room < ApplicationRecord
  # status if the room is available to be booked
  scope :available, -> { where(status: 'disponible') }
  scope :unavailable, -> { where(status: 'indisponible') }

  enum status: { disponible: 0, indisponible: 1 }

  def self.expositions
    ['village', 'clain', "cour d'honneur", 'jardin haut']
  end

  def self.total_capacity
    all.select { |room| room.capacity < 40 }
       .map(&:capacity).reduce(:+)
  end
end
