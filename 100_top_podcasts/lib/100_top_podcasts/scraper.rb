class TopPodcasts::Scraper

  def get_page
    doc = Nokogiri::HTML(open("https://www.stitcher.com/stitcher-list/all-podcasts-top-shows"))

    binding.pry
  end

  def scrape_podcasts_index
    self.get_page.css("div#sl-container li")
  end

  def make_podcasts
    scrape_podcasts_index.each do |p|
      TopPodcasts::Podcast.new_from_index_page(p)
    end
  end
end
