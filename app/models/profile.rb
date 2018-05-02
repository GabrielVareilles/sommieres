# == Schema Information
#
# Table name: profiles
#
#  id         :bigint(8)        not null, primary key
#  birth_date :date
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Profile < ApplicationRecord
  belongs_to :user, optional: true
  delegate :email, to: :user

  def age
    return nil unless birth_date
    now = Time.now.utc.to_date
    now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
