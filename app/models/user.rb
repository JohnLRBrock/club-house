class User < ApplicationRecord
  attr_accessor :remember_token
  before_create :new_remember_token
  has_secure_password

  def new_token
    SecureRandom.urlsafe_base64
  end

  #creates and assigns a new remember token for user
  def new_remember_token
    puts "new remember token"
    self.remember_token = new_token
    self.remember_digest = Digest::SHA1.hexdigest(self.remember_token)
    puts "new token is #{self.remember_token}"
    puts "new digest is #{self.remember_digest}"
    self.save
  end

  def authenticated?(remember_token)
    puts "in authenticated?"
    puts "Digested remember token is #{Digest::SHA1.hexdigest(remember_token)}"
    puts "Comparing it to users digest #{self.remember_digest}"
    Digest::SHA1.hexdigest(remember_token) == self.remember_digest
  end
end
