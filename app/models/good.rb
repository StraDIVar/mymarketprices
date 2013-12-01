class Good < ActiveRecord::Base
  has_many :prices

  attr_accessible :name, :note

  validates :name, presence: true, uniqueness: true
end
