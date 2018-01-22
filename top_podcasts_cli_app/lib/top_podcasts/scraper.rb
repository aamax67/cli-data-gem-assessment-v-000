require_relative '../podcast.rb'

class TopPodcasts::Scraper

  def get_page

    Nokogiri::HTML(open("http://toppodcast.com/top-200-podcast/"))

  end

  def scrape_podcasts_index
    self.get_page.css(".podcastRow")
  end

  def make_podcasts
    scrape_podcasts_index.each do |p|
      TopPodcasts::Podcast.new_from_index_page(p)
    end
  end
end
