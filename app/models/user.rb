class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :password, :password_confirmation, :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates :password, confirmation: true
  validates :password, length: {minimum: 6}

end
