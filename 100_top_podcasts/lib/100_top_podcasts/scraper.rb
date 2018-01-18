require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def get_page
    doc = Nokogiri::HTML(open("https://www.stitcher.com/stitcher-list/all-podcasts-top-shows"))
    names = doc.search("td[class='sl-rank'] span[class='sl-showName'] a[class='url']")
    names.collect{|m| new(m.text.strip, "https://www.stitcher.com/stitcher-list/all-podcasts-top-shows#{m.attr("href").split("?").first.strip}")}

    binding.pry
  end
end

Scraper.new.get_page
