  require_relative './podcast.rb'

class TopPodcasts::Scraper

  def get_page
    doc = Nokogiri::HTML(open("http://toppodcast.com/top-200-podcast/"))

    doc.css(".podcastRow").each do |podcast|
      podcast = Podcast.new
      podcast.name = podcast.css("h3").text
      podcast.position = podcast.css(".numberImage").text
      podcast.summary = podcast.css(".podcastBlock podcastBlock3").first.css("p").text
    end
  end

  def scrape_podcasts_index
    self.get_page.css(".podcastRow")
  end

  def make_podcasts
    scrape_podcasts_index.each do |podcast|
      TopPodcasts::Podcast.new
    end
  end
end
