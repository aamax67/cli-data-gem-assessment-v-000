class TopPodcasts::Podcast

  attr_accessor :name, :position, :producer, :url

  @@all = []

  def self.new_from_index_page(p)
    self.new()
    #Scrape Songkick and return concerts based on that data
    # It should return a bunch of instances of Concert
    self.scrape_deals
  end


  def self.scrape_concerts
      concerts = []
      # Go to Songkick, find the concert properties
      # extract the properties
      # instantiate a concert

      deals
  end
end
