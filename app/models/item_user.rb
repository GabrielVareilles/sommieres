# == Schema Information
#
# Table name: item_users
#
#  id         :bigint(8)        not null, primary key
#  start      :date
#  stop       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :bigint(8)
#  pricing_id :bigint(8)
#  profile_id :bigint(8)
#
# Indexes
#
#  index_item_users_on_item_id     (item_id)
#  index_item_users_on_pricing_id  (pricing_id)
#  index_item_users_on_profile_id  (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (pricing_id => pricings.id)
#  fk_rails_...  (profile_id => profiles.id)
#

class ItemUser < ApplicationRecord
  belongs_to :profile
  belongs_to :item
  belongs_to :pricing

  def start
    super.blank? ? item.reservation.start : super
  end

  def stop
    super.blank? ? item.reservation.stop : super
  end

  def nights
    (stop - start).to_i
  end

  def price
    nights * pricing.price_cents / 100.0 + maintenance
  end

  def maintenance
    pricing.price_cents == 0 ? 0 : nights * 1.80
  end
end
