# frozen_string_literal: true

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
    (total_price_without_fees + technical_fees).round(2)
  end

  def technical_fees
    (total_price_without_fees * 0.008).round(2)
  end

  def total_price_without_fees
    reservation_empty?
    total = item_users.reduce(0) do |acc, item_user|
      acc + item_user.price
    end
    (total * modifier.percent / 100.0).round(2)
  end

  def night_count
    reservation_empty?
    item_users.reduce(0) { |acc, item_user| acc + nights(item_user) }
  end

  def last_night_day
    stop - 1.day
  end

  def people_count
    reservation_empty?
    item_users.size
  end

  def occupancy(date)
    occupancy = 0
    items.each do |item|
      count = item.item_users.map { |item_user| item_user_by_date(item_user, date) }.compact
      occupancy += item.room.capacity <= count.size ? item.room.capacity : count.size
    end
    occupancy
  end

  def status_label
    # TODO: decorator
    '<span class="' + "label label-#{btn_class}" + '">' + status + '</span>'
  end

  def btn_class
    # TODO: decorator
    case status
    when 'pending'
      :warning
    when 'accepted'
      :primary
    when 'payed'
      :success
    end
  end

  def item_user_by_date(item_user, date)
    item_user if (item_user.start..item_user.stop).cover? date
  end

  def item_users_by_date(item, date)
    users = item.item_users.map do |item_user|
      item_user_by_date(item_user, date)
    end
    users.compact
  end

  def participants(date)
    # TODO: decorator
    html = ''
    html += '<div class="container">'
    html += "<div class='row'>"
    items.map do |item|
      users = item_users_by_date(item, date)
      next if users.empty?
      html += "<div class='col-xs-4'>"
      html += "<div class='panel panel-default'>"
      html += "<div class='panel-heading'>"
      html += "<span><i class='fa fa-bed'></i>  #{item.room.name}</span>"
      html += '</div>'
      html += "<div class='panel-body'>"
      html += '<ul class="list-unstyled">'
      html += users.map { |iu| '<li><i class="fa fa-user"></i>  ' + iu.profile.full_name + '</li>' }.join
      html += '</ul>'
      html += '</div></div></div>'
    end
    html += '</div></div>'
    html
  end

  def full_name
    # TODO: decorator
    user.profile.full_name
  end

  def reservation_empty?
    return nil if items.empty?
    return nil if items.first.item_users.empty?
  end

  def item_users
    items.map(&:item_users).flatten
  end

  def nights(item_user)
    (item_user.stop - item_user.start).to_i
  end
end
