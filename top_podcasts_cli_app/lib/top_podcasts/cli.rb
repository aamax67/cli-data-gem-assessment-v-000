class TopPodcasts::CLI

  def call
    start
  end

  def list
    puts ""
    puts "----------------- Top 200 Podcasts ----------------"
    puts ""
    TopPodcasts::Podcast.all.each.with_index(1) do |podcast, i|
      puts "#{i}. #{podcast.title}"
    end
    puts ""
  end

  def print_podcast(podcast)
    puts ""
    puts "----------- #{podcast.position} - #{podcast.title} -----------"
    puts ""
    puts "----------------------------Summary---------------------------"
    puts ""
    puts "#{podcast.summary}"
    puts ""
  end

  def start
    list
    input = nil
      while input != "exit"
      puts ""
      puts "What podcast would you like more information on, by name or number?"
      puts ""
      puts "Enter list to see the podcasts again."
      puts "Enter exit to end the program"
      puts ""
      input = gets.strip
      if input == "list"
        list
      elsif input.to_i == 0
        if podcast = TopPodcasts::Podcast.find_by_title(input)
          print_podcast(podcast)
        end
      elsif input.to_i > 0
        if podcast = TopPodcasts::Podcast.find(input.to_i)
          print_podcast(podcast)
        end
      end
    end
    puts "Goodbye"
  end
end
