class Card < ActiveRecord::Base
  attr_accessible :cmc, :color, :name, :rarity, :type
  belongs_to :release
  has_one :price
end
