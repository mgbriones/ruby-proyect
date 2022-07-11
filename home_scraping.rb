require 'httparty'
require 'nokogiri'
require 'byebug' #sirve para identificar bug


# >>    PROYECTO    <<
# En este proyecto se busca scrapear los departamentos ubicados en providencia.
# Se pone como requisito que estos tengan 2 baños.
# Como fuente de informacion se utilizará PORTALINMOBILIARIO.COM

def scraper
   
# En este array se guardaran los departamentos con los requerimientos solicitados
   result = Array.new
  
   url = "https://www.portalinmobiliario.com/arriendo/departamento/providencia-metropolitana/_Desde_2_Banos_2_NoIndex_True"
   # url = "https://news.ycombinator.com/"
   for i in (0..7)
      url = "https://www.portalinmobiliario.com/arriendo/departamento/providencia-metropolitana/_Desde_" + (50 * i +1).to_s + "_Banos_2_NoIndex_True"
      
      unparsed_page =HTTParty.get(url)
      parsed_page = Nokogiri::HTML(unparsed_page)
      departamentos = parsed_page.css('div.andes-card.andes-card--flat.andes-card--default.ui-search-result.ui-search-result--res.andes-card--padding-default')
      departamentos.each do |resp|
      #    result << resp.text
         departamento = {          
            :direccion => resp.css('p.ui-search-item__group__element.ui-search-item__location').text,
            :monto => resp.css('span.price-tag-amount').text,
            :dormitorios => resp.css('li.ui-search-card-attributes__attribute').text,
            :area => resp.css('li.ui-search-card-attributes__attribute').text,
            
         }
         result << departamento
      end

   end

end

scraper