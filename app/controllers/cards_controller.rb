class CardsController < ApplicationController

  def parse
    TCGParser.parse()
    head :no_content
  end

  def by_name
    name = params[:name]

    card = Card.where(name: name).first

    render :json => {name: name, card_type: card.card_type, rarity: card.rarity, cmc: card.cmc, color: card.color}
  end

end
