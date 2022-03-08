require 'bcrypt'
class User < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password, confirmation: true

  has_secure_password

  # before_create :api_key_generate

  def self.api_key_generate
    randomizer = SecureRandom.base64.tr('+/=', 'Qrt')
  end
end
