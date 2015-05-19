class User < ActiveRecord::Base

  validates :email, :uniqueness => true, :allow_nil => false
  validates :password, :presence => true

end
