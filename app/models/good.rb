class Good < ActiveRecord::Base
  attr_accessible :name, :note

  validates :name, presence: true
end
