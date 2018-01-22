class TopPodcasts::CLI

  def call
    TopPodcasts::Scraper.new.make_podcasts
    puts "Welcome to the 200 Top Podcasts"
    start
  end

  def start
    puts ""
    puts "What number podcasts would you like to see?  1-25, 26-50, 51-75, 76-100, 101- 125, 126-150, 151-175, 176-200?"
    input = gets.strip.to_i

    print_podcast(input)

    puts ""
    puts "What podcast would you like more information on?"
    input = gets.strip.to_i

    podcast = TopPodcasts::Podcast.find(input.to_i)

    print_podcast(podcast)

    puts ""
    puts "Would you like to see another podcast?  Enter Y or N"

    input = gets.strip.to_i
    if input == "Y"
      start
    else
      puts ""
      puts "Thankyou! Have a nice day!"
      exit
    end
  end

  def print_podcast(podcast)
    puts ""
    puts "----------- #{podcast.name} - #{podcast.position} -----------"
    puts ""
    puts "Producer:             #{podcast.producer}"
    puts "website               #{podcast.url}"
    puts ""
    puts "------------------Summary-------------------"
    puts ""
    puts "#{podcast.summary}"
    puts ""
  end

  def print_podcasts(from_number)
    puts ""
    puts "------------- Podcasts #{from_number} - #{from_number+24} ---------"
    puts ""
    TopPodcasts::Podcast.all[from_number-1, 25].each.with_index(from_number) do |podcast, index|
      puts "#{index}. #{podcast.name} - #{podcast.producer}"
    end
  end
end
