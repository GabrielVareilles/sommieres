# == Schema Information
#
# Table name: reservations
#
#  id          :bigint(8)        not null, primary key
#  start       :date
#  status      :integer          default("pending")
#  stop        :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  modifier_id :bigint(8)
#  user_id     :bigint(8)
#
# Indexes
#
#  index_reservations_on_modifier_id  (modifier_id)
#  index_reservations_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (modifier_id => modifiers.id)
#  fk_rails_...  (user_id => users.id)
#

class Reservation < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  belongs_to :modifier
  accepts_nested_attributes_for :items

  enum status: { pending: 0, accepted: 1, payed: 2 }

  def total_price
    reservation_empty?
    total = item_users.reduce(0) do |acc, item_user|
      acc + item_user.price
    end
    (total * modifier.percent / 100.0).round
  end

  def night_count
    reservation_empty?
    item_users.reduce(0) { |acc, item_user| acc + nights(item_user) }
  end

  def people_count
    reservation_empty?
    item_users.size
  end

  private

  def reservation_empty?
    return nil if items.empty?
    return nil if items.first.item_users.empty?
  end

  def item_users
    items.map { |item| item.item_users}.flatten
  end

  def nights(item_user)
    (item_user.stop - item_user.start).to_i
  end
end











