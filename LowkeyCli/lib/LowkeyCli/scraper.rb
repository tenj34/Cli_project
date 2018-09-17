class LowkeyCli::Scraper
# our scraper class
  def get_page
    puts "***********Scrape Page *******"
    doc = Nokogiri::HTML(open("https://www.lowkey.industries/shop/?category=Sweatshirts"))
  end

  def scrape_sweatshirts
    get_page.css(".ProductList-item")
  end

  def create_sweatshirts
    scrape_sweatshirts.each do |sweatshirt_html|
      new_sweatshirt_html(sweatshirt_html)
    end
    LowkeyCli::Sweatshirt.all
  end

  def new_sweatshirt_html(sweatshirt_html)
    # go to Lowkey
    # extract the properties from the first page
    # show info on the sweatshirts
    LowkeyCli::Sweatshirt.new(
      sweatshirt_html.css(".ProductList-title").text,
      sweatshirt_html.css("a").attribute('href').value,
      sweatshirt_html.css(".product-price").text.strip
    )
  end

  def self.scrape_details(choice)
    puts "***********Scrape Details *******"
    doc2 = Nokogiri::HTML(open("https://www.lowkey.industries#{choice.url}"))
    choice.details = doc2.css(".ProductItem-details-excerpt").text
    choice.sizes = doc2.css(".variant-select-wrapper").text.strip

  end


end
