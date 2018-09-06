# CLI Controller
require 'date'

class LowkeyCli::CLI

  def call
    puts "Welcome to Lowkey ClI"
    puts "These are the sweatshirts available as of #{Date.today}."
  end

end
