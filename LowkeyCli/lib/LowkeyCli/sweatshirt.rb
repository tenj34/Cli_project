class LowkeyCli::Sweatshirt
  attr_accessor :name, :url, :price, :description

  def initialize
    @name = name
    @url = url
    @price = price
    @description = description
  end

  def self.new_sweathshirt_html(sweatshirt_html)
    # go to Lowkey
    # extract the properties from the first page
    # show info on the sweatshirts
    self.new(
      sweatshirt.name = doc.css(".ProductList-title").text
      sweatshirt.price = doc.css(".product-price").text
      sweatshirt.url = doc.css(".ProductList-grid.clear a[href]").attribute("href").value
    )
  end
end
