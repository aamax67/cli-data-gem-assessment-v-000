class TopPodcasts::Podcast

  attr_accessor :name, :position, :summary, :producer, :url

  @@all = []

  def self.new_from_index_page(p)
    self.new(p.css("h3").text,
    "http://toppodcast.com/top-200-podcast/#{p.css("a").attribute("href").text}",
    p.css(".numberImage")
    )
  end


  def initialize(name=nil, url=nil, producer=nil, summary = nil, position=nil)
      @name = name
      @url = url
      @producer = producer
      @position = position
      @summary = summary
      @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def self.find_by_name(name)
    self.all.detect do |p|
      p.name.downcase.strip == name.downcase.strip ||
      p.name.split("(").first.strip.downcase == name.downcase.strip
    end
  end

  def summary
    @summary ||= podcast_summary_doc.search("p.")

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

end
