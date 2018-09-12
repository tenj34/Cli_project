
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
        # puts description
        # puts price
        puts "hi"
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
