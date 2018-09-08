class LowkeyCli::Scraper
# our scraper class
  def get_page
    doc = Nokogiri::HTML(open("https://www.lowkey.industries/shop/?category=Sweatshirts"))
  end

  def scrape_sweatshirts
    get_page.css = (".ProductList-grid.clear")
  end

  def create_sweatshirts
    scrape_sweatshirt.each do |sweatshirt_html|
      LowkeyCli::Sweatshirt.new_sweathshirt_html(sweatshirt_html)
    end
  end

end
