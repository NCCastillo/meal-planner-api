class User < ApplicationRecord
  has_secure_password

  has_many :menus

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  def current_menu
    menus.where(week_of: this_week)
  end

  private

  def this_week
    "#{Date.today.beginning_of_week}_#{Date.today.end_of_week}"
  end
end
