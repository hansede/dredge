class Card < ActiveRecord::Base
  attr_accessible :cmc, :color, :name, :rarity, :card_type
  belongs_to :release
  has_many :prices
end
