# CLI Controller
require 'date'

class LowkeyCli::CLI

  def call
    greetings
    list_sweatshirts
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

    puts "Welcome to Lowkey ClI"
    puts "These are the sweatshirts available as of #{Date.today}."
  end

  def list_sweatshirts
    @sweatshirt = LowkeyCli::Sweatshirt.today

  end

end
