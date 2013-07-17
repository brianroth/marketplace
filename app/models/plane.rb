class Plane < ActiveRecord::Base
  attr_accessible :name, :unlock_level
  default_scope order('unlock_level ASC')
  
  validates_presence_of :name
  validates_presence_of :unlock_level
end