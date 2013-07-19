class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :plane
  belongs_to :part
  attr_accessible :active, :comment
end
