class TopPodcasts::CLI

  def call
    list_podcasts
    menu
    goodbye
  end

  def list_podcasts
    puts "Welcome to today's top 100 Podcasts:"
    @podcasts = TopPodcasts::Podcast.today
    @podcasts.each.with_index(1) do |podcasts, i|
      puts "#{i}. #{podcast.name} - #{podcast.producer} - #{podcast.url}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the podcast you'd like more info on or type list to see the podcasts again or type exit to enter:"
      input = gets.strip.downcase

      if input.to_i > 0
        the_podcast = @podcasts[input.to_i-1]
        puts "#{the_podcast.date} - #{the_podcast.producer} - #{the_concert.url}"
      elsif input == "list"
        list_podcasts
      else
        puts "Not sure what you are trying to do, type list or exit to try again."
      end
    end
  end

  def goodbye
    puts "Enjoy your Podcasts. Check back soon for an updated list."
  end
end
