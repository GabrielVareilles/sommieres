# == Schema Information
#
# Table name: items
#
#  id             :bigint(8)        not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  reservation_id :bigint(8)
#  room_id        :bigint(8)
#
# Indexes
#
#  index_items_on_reservation_id  (reservation_id)
#  index_items_on_room_id         (room_id)
#
# Foreign Keys
#
#  fk_rails_...  (reservation_id => reservations.id)
#  fk_rails_...  (room_id => rooms.id)
#

class Item < ApplicationRecord
  belongs_to :reservation
  has_many :item_users, dependent: :destroy
  belongs_to :room

  accepts_nested_attributes_for :item_users
end
