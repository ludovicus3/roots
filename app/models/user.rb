class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true

  def self.find_or_create_by_omniauth(auth)
    self.find_or_create_by(email: auth["info"]["email"])
  end
end