class User < ActiveRecord::Base
  def self.auth?(email, password)
    find_by(email: email, password: password)
  end
end
