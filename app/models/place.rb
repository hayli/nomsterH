class Place < ActiveRecord::Base
  belongs_to :user
  has_many  :comments
  has_many  :photos

  geocoded_by :address
  after_validation :geocode

  validates :name, :presence => true, :length => { :minimum => 4 }
  validates :description, :presence => true, :length => { :maximum => 500, :minimum => 4 }
  validates :address, :presence => true, :length => { :maximum => 200, :minimum => 4 }
end
