class Iron < ActiveRecord::Base

  has_many :pros 

  validates_presence_of :brand
  validates_presence_of :name

end
