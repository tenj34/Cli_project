class LowkeyCli::Sweatshirt
  attr_accessor :name, :url, :price, :description

  def initialize
    @name = name
    @url = url
    @price = price
    @description = description
  end


  def self.today
    self.scrape_sweatshirt
  end

  def self.scrape_sweatshirt
    # go to Lowkey
    # extract the properties from the first page
    # show info on the sweatshirts

    show_sweatshirt = []

    show_sweatshirt = self.lowkey_scrape_sweatshirt

    show_sweatshirt

  end

  def self.lowkey_scrape_sweatshirt
    doc = Nokogiri::HTML(open("https://www.lowkey.industries/shop/?category=Sweatshirts"))
    sweatshirt = self.new
    sweatshirt.name = doc.css(".ProductList-title")[0].text
    sweatshirt.price = doc.css(".product-price .sqs-money-native")[0].text
    sweatshirt.url = doc.css(".ProductList-grid.clear a[href]").attribute("href").value

    sweatshirt
  end
end
