class Place < ActiveRecord::Base
  belongs_to :user

  attr_accessible :name, :note

  validates_presence_of :name
  validates_uniqueness_of :name
end
