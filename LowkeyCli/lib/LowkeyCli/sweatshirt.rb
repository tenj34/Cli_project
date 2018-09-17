class LowkeyCli::Sweatshirt
  attr_accessor :name, :url, :price, :details, :sizes

  @@all = []

  def initialize(name = nil, url= nil, price = nil) # nil
    @name = name
    @price = price
    @url = url
    save
  end


  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_by_index(index)
    @@all[index]
  end
end
