

class CardsController < ApplicationController
  def parse
    TCGParser.parse()
    head :no_content
  end
end
