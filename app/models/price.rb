class Price < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  belongs_to :good

  attr_accessible :value, :place, :good

  validates_presence_of :value, :user_id, :place_id, :good_id
  validates :value, numericality: { only_integer: true, greater_than: 0 }
end
