require 'nokogiri'
require 'open-uri'

class TCGParser

  def self.parse
    page = Nokogiri::HTML(open('http://magic.tcgplayer.com/magic_price_guides.asp'))
    links = page.css('a.default_9')
    sets = []

    links.each do |link|
      sets.push(name: link.text, url: URI.encode(link['href']))
    end

    sets.each do |set|
      address = "http://magic.tcgplayer.com#{set[:url]}"
      parse_set(set[:name], Nokogiri::HTML(open(address)))
    end
  end

  def self.parse_set(name, page)
    print("parsing: #{name}\n")
    release = Release.find_or_create_by_name(name)
    rows = page.css('body table:last > tr')

    ActiveRecord::Base.transaction do
      rows.each do |row|
        name = row.css('td:first > font').text.downcase
        cmc = row.css('td:eq(2) > font').text.downcase
        type = row.css('td:eq(3) > font').text.downcase
        color = row.css('td:eq(4) > font').text.downcase
        rarity = row.css('td:eq(5) > font').text.downcase
        high = numberFromText(row.css('td:eq(6) > font').text)
        medium = numberFromText(row.css('td:eq(7) > font').text)
        low = numberFromText(row.css('td:eq(8) > font').text)
        print("#{name}\n") #" #{cmc} #{type} #{color} #{rarity} #{high} #{medium} #{low}\n")
        card = release.cards.find_or_create_by_name(name)
        card.update_attributes(cmc: cmc, card_type: type, color: color, rarity: rarity)
        card.prices.create(high: high, medium: medium, low: low)
      end
    end
  end

  def self.numberFromText(text)
    match = (text).match(/(\d+\.\d+)/)

    if match.nil? || match.length < 2
      BigDecimal.new '0.00'
    else
      BigDecimal.new match[1]
    end
  end

end