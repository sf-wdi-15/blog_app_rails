class User < ActiveRecord::Base
  has_secure_password
  has_many :articles

  def self.confirm(email_param, password_param)
    user = User.find_by({email: email_param})
    user.authenticate(password_param)
  end

  def set_password_reset
    self.code = SecureRandom.urlsafe_base64
    self.expires_at = 4.hours.from_now
    self.save!
  end

end

# require 'bcrypt'

# class User < ActiveRecord::Base
#   BCrypt::Engine.cost = 12

#   attr_reader :password

#   validates_confirmation_of :password
#   validates_presence_of :password_digest

#   def password=(unencrypted_password)
#     if unencrypted_password.nil?
#       ##when the password is nil
#       self.password_digest = nil
#     else 
#       ## when not nil update password just for temporary reference
#       @password = unencrypted_password
#       ## update password_digest using hashing algorithm
#       self.password_digest = BCrypt::Password.create(@password)
#     end
#   end

#   def authenticate(unencrypted_password)
#     if BCrypt::Password.new(password_digest) == unencrypted_password
#       self
#     else
#       false
#     end
#   end

#   def self.confirm(email_param, password_param)
#     user = User.find_by({email: email_param})
#     user.authenticate(password_param)
#   end

# end
