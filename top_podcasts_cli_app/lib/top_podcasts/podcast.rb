class TopPodcasts::Podcast

  attr_accessor :name, :position, :summary, :producer, :url

  @@all = []

  def self.new_from_index_page(p)
    self.new(
    p.css("h3").text,
    "http://toppodcast.com/top-200-podcast/#{p.css("a").attribute("href").text}",
    p.css(".numberImage").text
    )
  end


  def initialize(name=nil, url=nil, producer=nil, position=nil)
      @name = name
      @url = url
      @producer = producer
      @position = position
      @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def summary
    @summary ||= doc.css(".podcastBlock podcastBlock3").first.css("p").text
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

end
