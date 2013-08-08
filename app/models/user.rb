class User < ActiveRecord::Base
  has_secure_password

  # implimented authentication via bcrypt
  # def self.authenticate
  # end
end
