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
      print("parsing: #{set[:name]}\n")
      parse_set(Nokogiri::HTML(open(address)))
    end
  end

  def self.parse_set(page)
    rows = page.css('body table:last > tr')

    rows.each do |row|
      name = row.css('td:first > font').text.downcase
      cmc = row.css('td:eq(2) > font').text.downcase
      type = row.css('td:eq(3) > font').text.downcase
      color = row.css('td:eq(4) > font').text.downcase
      rarity = row.css('td:eq(5) > font').text.downcase
      high = row.css('td:eq(6) > font').text
      medium = row.css('td:eq(7) > font').text
      low = row.css('td:eq(8) > font').text
      print("#{name} #{cmc} #{type} #{color} #{rarity} #{high} #{medium} #{low}\n")
    end
  end

end