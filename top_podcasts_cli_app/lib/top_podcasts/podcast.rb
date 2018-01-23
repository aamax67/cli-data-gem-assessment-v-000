class TopPodcasts::Podcast

  attr_accessor :title, :position, :summary, :url

    @@all = []

  def initialize(title = nil, position = nil, url = nil)
      @title = title
      @position = position
      @url = url
  end

  def self.all
    @@all ||= scrape_podcasts
  end

  def self.find(id)
    self.all[id-1]
  end

  def self.find_by_title(title)
    self.all.detect do |p|
      p.title.downcase.strip == title.downcase.strip ||
      p.title.split("(").first.strip.downcase == title.downcase.strip
    end
  end

  def summary
    @summary ||= doc.css(".podcastRow").first.css("p").text.strip
  end

  private
    def self.scrape_podcasts
      doc = Nokogiri::HTML(open("http://toppodcast.com/top-200-podcast/"))
      names = doc.search("div[class='podcastBlock podcastBlock3'] a[class='view_show']")
      names.collect{|e| new(e.text.strip, "http://toppodcast.com/top-200-podcast/#{e.attr("href").first.strip}")}
    end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

  def podcast_summary_doc
    @podcast_summary_doc ||= Nokogiri::HTML(open("#{self.url}entry-content"))
  end

end
