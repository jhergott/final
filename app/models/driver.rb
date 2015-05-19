class Driver < ActiveRecord::Base

  validates_presence_of :brand
  validates_presence_of :name

end
