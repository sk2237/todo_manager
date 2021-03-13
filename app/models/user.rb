class User < ActiveRecord::Base
  has_secure_password
  has_many :todos
  def self.auth?(email, password)
    find_by(email: email, password: password_digest)
  end
end
