class Price < ActiveRecord::Base
  attr_accessible :high, :low, :medium
  belongs_to :card
end
