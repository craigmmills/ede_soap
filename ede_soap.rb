require 'savon'
require 'nokogiri'
# require 'sinatra'

# call the wsdl

# get '/countries/:country_id/parameters/:parameter_id' do

# country_id = params[:country_id]
# parameter_id = params[:parameter_id]

country_id = "TZ"
parameter_id = "1"
output = ""

   # grab the xml file and adjust some parameters based on the request
   f = File.open("ede.xml")
      doc = Nokogiri::XML(f)

      id = doc.at_css "ID"
      id.content = parameter_id

      country = doc.at_css "CountryID"
      country.content = country_id

      client = Savon.client(wsdl: "http://geodata.grid.unep.ch/webservices/table_values_response.php?wsdl", pretty_print_xml: true)
      response = client.call(:data_search, xml: doc.to_s)
      
      output = response.body


   f.close

# end


#puts output