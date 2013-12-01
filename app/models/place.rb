class Place < ActiveRecord::Base
  belongs_to :user
  has_many :prices

  attr_accessible :name, :note

  validates_presence_of :name
  validates_uniqueness_of :name
end
