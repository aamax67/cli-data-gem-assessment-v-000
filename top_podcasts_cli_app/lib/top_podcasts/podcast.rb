class TopPodcasts::Podcast

  attr_accessor :title, :position, :summary

  @@all = []

  def self.new_from_index_page(p)
    self.new(
    p.css(".podcastRow").first.css("h3").text.strip,
    p.css(".podcastRow").first.css(".numberImage").text.strip,
    )
  end


  def initialize(title=nil, position=nil)
      @title = title
      @position = position
      @@all << self
  end

  def self.all
    @@all
  end

  def summary
    @summary ||= doc.css(".podcastRow").first.css("p").text.strip
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

end
