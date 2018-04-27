# == Schema Information
#
# Table name: reservations
#
#  id         :bigint(8)        not null, primary key
#  status     :integer          default("pending")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#
# Indexes
#
#  index_reservations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Reservation < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items

  enum status: { pending: 0, accepted: 1, payed: 2 }

  def start_date
    reservation_empty?
    # TODO
    nil
  end

  def end_date
    reservation_empty?
    # TODO
    nil
  end

  def total_price
    reservation_empty?
    item_users.reduce(0) do |acc, item_user|
      acc + item_user.price
    end
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










