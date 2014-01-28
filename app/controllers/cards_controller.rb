

class CardsController < ApplicationController
  def parse
    TCGParser.parse()
  end
end
