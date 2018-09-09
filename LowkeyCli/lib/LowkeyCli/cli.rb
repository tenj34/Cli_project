
# CLI Controller
require 'date'

class LowkeyCli::CLI

  def call
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
  end

  def list_sweatshirts
=begin
    @sweatshirt = LowkeyCli::Sweatshirt.today
    #@sweatshirt.attributes.each do |pieces|
      puts "#{@sweatshirt.name}"
    #end
=end
    LowkeyCli::Scraper.new.create_sweatshirts

    LowkeyCli::Sweatshirt.all.each do |pieces|
      puts "#{pieces.price}"
    end
  end

  def menu
    input = nil

    while input != "exit"
      puts "Enter the number of the sweatshirt you'd like more info on or type exit or type list:"
      input = gets.strip.downcase

      if input.to_i > 0
        # puts description
        # puts price
        puts "hi"
      elsif input == "list"
        list_sweatshirts
      elsif input == "exit"
        puts "Exiting...".colorize(:red)
      else
        puts "Incorrect input, please try again!"
      end
    end
  end

  def sweatshirt_detail
    #details about sweatshirt

  end

  def goodbye
    puts "Thanks for using LowkeyCli"
  end
end
