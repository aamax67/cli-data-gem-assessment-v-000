class TopPodcasts::Scraper

  def get_page
    doc = Nokogiri::HTML(open("https://www.stitcher.com/stitcher-list/all-podcasts-top-shows"))

    binding 'pry'
  end
end

Scraper.new.get_page