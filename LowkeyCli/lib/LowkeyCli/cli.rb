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

    puts "Welcome to Lowkey CLI"
    puts "These are the sweatshirts available as of #{Date.today}."
  end

  def list_sweatshirts
    @sweatshirt = LowkeyCli::Sweatshirt.today
    @sweatshirt.each.with_index(1) do |piece,i|
      puts "#{i}. #{piece.name}, #{piece.price}"
    end
  end

  def menu
    input = nil

    while input != "exit"
      puts "Enter the number of the sweatshirt you'd like more info on or type exit or type list:"
      input = gets.strip.downcase

      if input.to_i > 0
        puts "hi"
      elsif input == "list"
        list_sweatshirts
      else
        puts "Incorrect input, please try again!"
      end
    end
  end

  def goodbye
    puts "Thanks for using LowkeyCli"
  end
end
