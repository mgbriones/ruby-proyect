require 'httparty'
require 'nokogiri'
require 'byebug' #sirve para identificar bug

# url1 = "https://www.portalinmobiliario.com/arriendo/departamento/providencia-metropolitana"
# url2 ="https://news.ycombinator.com/"

def scraper
   url = "https://news.ycombinator.com/"
   result = Array.new
   unparsed_page =HTTParty.get(url)
   parsed_page = Nokogiri::HTML(unparsed_page)
   resp_listing = parsed_page.css('a.titlelink')
   resp_listing.each do |resp|
      result << resp.text
   end
   # byebug 
   puts result
end

scraper