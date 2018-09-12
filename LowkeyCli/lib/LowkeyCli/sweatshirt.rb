class LowkeyCli::Sweatshirt
  attr_accessor :name, :url, :price, :description

  @@all = []

  def initialize(name = nil, url= nil, price = nil) # nil
    @name = name
    @price = price
    @url = url
    save
  end

  def self.new_sweatshirt_html(sweatshirt_html)
    # go to Lowkey
    # extract the properties from the first page
    # show info on the sweatshirts
    self.new(
      sweatshirt_html.css(".ProductList-title").text,
      sweatshirt_html.css("a").attribute('href').value,
      sweatshirt_html.css(".product-price").text.strip
    )
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
