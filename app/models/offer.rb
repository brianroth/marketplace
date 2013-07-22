class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :plane
  belongs_to :part
  attr_accessible :active, :comment, :plane_id, :part_id, :user_id

  validates :user, :presence => {:message => 'You must be logged in to create an offer'}
  validates :plane, :presence => {:message => 'You must select a plane'}
  validates :comment, :presence => {:message => 'You must enter a comment'}

  scope :active, -> { where(:active => true) }
end
