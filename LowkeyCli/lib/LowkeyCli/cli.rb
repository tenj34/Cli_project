
# CLI Controller
require 'date'

class LowkeyCli::CLI

  def call
    build_sweatshirt
    greetings
    list_sweatshirts
    menu
    goodbye
  end

  def greetings
      puts <<-'EOF'
      ___      _______  _     _  ___   _  _______  __   __
     |   |    |       || | _ | ||   | | ||       ||  | |  |
     |   |    |   _   || || || ||   |_| ||    ___||  |_|  |
     |   |    |  | |  ||       ||      _||   |___ |       |
     |   |___ |  |_|  ||       ||     |_ |    ___||_     _|
     |       ||       ||   _   ||    _  ||   |___   |   |
     |_______||_______||__| |__||___| |_||_______|  |___|
     EOF

    puts "Welcome to Lowkey CLI".colorize(:light_blue)
    puts "These are the sweatshirts available as of #{Date.today}."
    puts " "
  end

  def list_sweatshirts
    sweatshirt = LowkeyCli::Sweatshirt.all
    sweatshirt.each.with_index(1) {|pieces,i| puts "#{i}. #{pieces.name}, $#{pieces.price}"}
  end

  def menu
    input = nil

    while input != "exit"
      puts " "
      puts "Enter the number of the sweatshirt you'd like more info on or type 'exit' or type 'list':"
      input = gets.strip.downcase

      if input.to_i > 0
        choice = LowkeyCli::Sweatshirt.find_by_index(input.to_i-1) # 1
        puts "Going to ... https://www.lowkey.industries#{choice.url}".colorize(:light_blue)
        doc2 = Nokogiri::HTML(open("https://www.lowkey.industries#{choice.url}"))
        sweatshirt_details = doc2.css(".ProductItem-details-excerpt").text
        puts "#{sweatshirt_details}"
        
      elsif input == "list"
        puts " "
        list_sweatshirts
      elsif input == "exit"
        puts "Exiting...".colorize(:red)
      else
        puts "Incorrect input, please try again!"
      end
    end
  end

  def build_sweatshirt
    LowkeyCli::Scraper.new.create_sweatshirts
  end

  def sweatshirt_detail
    #details about sweatshirt

  end

  def goodbye
    puts "Thanks for using LowkeyCli"
  end
end
