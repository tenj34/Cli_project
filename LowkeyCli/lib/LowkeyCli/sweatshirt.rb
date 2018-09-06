class LowkeyCli::Sweatshirt
  attr_accessor :name, :url, :price

  def self.today
    self.scrape_sweatshirt
  end

  def self.scrape_sweatshirt
    # go to Lowkey
    # extract the properties from the first page
    # show info on the sweatshirts

    sweatshirt = []

    show_sweatshirt = self.lowkey_scrape_sweatshirt

    show_sweatshirt

  end

  def lowkey_scrape_sweatshirt

  end



end
