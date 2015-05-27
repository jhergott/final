class User < ActiveRecord::Base

  has_secure_password	

  validates :email, :uniqueness => true, :allow_nil => false
  validates :password, :presence => true

end
