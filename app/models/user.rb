class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :email, presence: true
  has_secure_password
  has_many :todos
  def self.auth?(email, password)
    find_by(email: email, password: password_digest)
  end
end
