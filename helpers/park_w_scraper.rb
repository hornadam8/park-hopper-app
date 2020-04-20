require_relative 'np_scraper'
require 'pry'

class ParkScraper
  attr_accessor :name, :link, :location, :description, :information, :weather, :tours_and_camping, :wildlife, :nearby_parks

  @@all = []

  def self.all
    @@all
  end

  def initialize(name=nil,link=nil)
    if name.include?("National Park")
      @name = name.rstrip
      @link = link
      self.assign_attributes
      @@all << self
    end
  end



  def assign_attributes

    #Finds info
    page = Scraper.get_park_page(self.link).css(".fieldset-wrapper")

    #Location(insert eye-roll emoji here)---------------------------------------

    location = page[3]

    if location.children.to_a.length >= 2

      if location.children[1].children[3].children[3].children[3].children.to_a.length > 1
        line_1 = location.children[1].children[3].children[3].children[3].children[1].children[0].text
        line_2 = location.children[1].children[3].children[3].children[3].children[3]


        if line_2
          #Group of parks?(#2 Arches confirmed) with an extra piece of info(Box#)
          line_2_sub = line_2.children[0].text.gsub("\n","").chomp(" ")
          line_3 = location.children[1].children[3].children[3].children[5].children.text.gsub("\n","").chomp(" ")
          line_4 = location.children[1].children[3].children[3].children[7].children[0].text
          self.location = "#{line_1} #{line_2_sub},  #{line_3}, #{line_4}"

        else
          #Most Parks
          alt_line_2 = location.children[1].children[3].children[3].children[5].children.text.gsub("\n","").chomp(" ")
          alt_line_3 = location.children[1].children[3].children[3].children[7].text
          self.location = "#{line_1},  #{alt_line_2}, #{alt_line_3}"
        end

      elsif location.children[1].children[3].children[3].children.to_a.length > 5
        #49.RMNP (Page built differently, children is a single array
        #as opposed to arrays separated by commas)
        line_1 = location.children[1].children[3].children[3].children[1].children[1].children.text
        line_2 = location.children[1].children[3].children[3].children[3].children.text.gsub("\n","").chomp(" ")
        line_3 = location.children[1].children[3].children[3].children[5].children.text
        self.location = "#{line_1},  #{line_2}, #{line_3}"

      else
        #56.WSNP (Built differently because location is an AF base and
        #doesnt have a street address)
        line_1 = location.children[1].children[3].children[3].children[1].children.text.gsub("\n","").chomp(" ")
        line_2 = location.children[1].children[3].children[3].children[3].children[0].text
        self.location = "#{line_1}, #{line_2}"
      end

    else
      #Group of parks?(#6. BCGNP confirmed) children is a single array
      line_1 = location.children[0].children[3].children[3].children[3].children[1].text
      line_2 = location.children[0].children[3].children[3].children[5].children.text.gsub("\n","").chomp(" ")
      line_3 = location.children[0].children[3].children[3].children[7].children[0].text
      self.location = "#{line_1},  #{line_2}, #{line_3}"
    end

    #Description--------------------------------------------------

    self.description = page[0].children[3].children.text.chomp("\n")

    #Information--------------------------------------------------

    information = page[0].children[11]

    if information
      self.information = information.children.text.split("   ")[0].split("<")[0].strip
    else
      self.information = page[0].text.split("   ")[0].split("Information")[1].split("<")[0].strip
    end

    #Weather-------------------------------------------------------

    weather = page[3].children[0].children[0].children[2]

    if weather
      self.weather = weather.children[1].children[0].text
    else
      self.weather = "There is no information available on the weather for this park."
    end

    #Tours and Camping---------------------------------------------

    tours_and_camping = page[3].children[0].children[1].children[2]

    if tours_and_camping
      self.tours_and_camping = tours_and_camping.children.text.gsub("\n","")
    else
      self.tours_and_camping = "There is no information available on the tours and camping in this park."
    end

    #Wildlife---------------------------------------------------------

    wildlife = page[3].children[0]

    if wildlife.children.to_a.length >= 3
      #Most Parks
      if wildlife.children[2].children.to_a.length >= 3
        self.wildlife = wildlife.children[2].children[2].children[1].children.text
      else
        #pages that have no wildlife section (and they're missing other info too i.e.
        #6 BCGNP, which has almost none of it's info on the page)
        self.wildlife = "There is no information available on wildlife in this park."
      end

    else
      #specifically Joshua Tree, which also has no wildlife section
      #and is constructed differently
      self.wildlife = "There is no information available on wildlife in this park."
    end

    #Nearby Parks--------------------------------------------------------------

    nearby_parks_page = Scraper.get_park_page(self.link).css(".three-col")

    park_1 = nearby_parks_page.children[10].children[1].children[3].children[1].text
    park_2 = nearby_parks_page.children[13].children[1].children[3].children[1].text
    park_3 = nearby_parks_page.children[16].children[1].children[3].children[1].text
    self.nearby_parks = []
    self.nearby_parks << park_1
    self.nearby_parks << park_2
    self.nearby_parks << park_3

    #END OF ATTRIBUTES---------------------------------------------------------

    #fixes strange bug with the construction of Yosemite's information
    if self.name == "Yosemite National Park"
      self.information = "#{self.information.split("<")[0]}"
    end

  end

end
