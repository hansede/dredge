class PricesController < ApplicationController

  def by_card
    card_id = params[:card_id]
    prices = Card.where(id: card_id).first.prices
    json = []

    prices.each do |price|
      json.push(high: price.high, medium: price.medium, low: price.low)
    end

    render :json => json
  end

  def by_release
    release_id = params[:release_id]
    cards = Release.where(id: release_id).first.cards
    json = []

    cards.each do |card|
      price = card.current_price
      json.push(id: card.id, name: card.name, price: {high: price.high.to_f, medium: price.medium.to_f, low: price.low.to_f})
    end

    render :json => json
  end
end
