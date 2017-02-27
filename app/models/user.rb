class User < ApplicationRecord
  attr_accessor :remember_token
  before_save :new_remember_digest
  has_secure_password

  def new_token
    SecureRandom.urlsafe_base64
  end

  #creates and assigns a new remember token for user
  def new_remember_digest
    self.remember_token = new_token
    self.remember_digest = Digest::SHA1.hexdigest(self.remember_token).to_s
  end

  def authenticated?(remember_token)
    Digest::SHA1.hexdigest(remember_token) == self.remember_digest
  end
end