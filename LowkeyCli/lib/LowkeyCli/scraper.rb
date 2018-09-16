class LowkeyCli::Scraper
# our scraper class
  def get_page
    doc = Nokogiri::HTML(open("https://www.lowkey.industries/shop/?category=Sweatshirts"))
  end

  def scrape_sweatshirts
    get_page.css(".ProductList-item")
  end

  def create_sweatshirts
    scrape_sweatshirts.each do |sweatshirt_html|
      LowkeyCli::Sweatshirt.new_sweatshirt_html(sweatshirt_html)
    end
  end
end
