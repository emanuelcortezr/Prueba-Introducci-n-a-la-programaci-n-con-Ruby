require 'rest-client'
require 'json'

api_key = '0Ws2ZgYUf25tTFiHmuyUPhqIvNlRNSTB3ODYu4Eo'
url_api_key = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=' + api_key


response = RestClient.get(url_api_key)

def build_web_page(response_hash)
    ruby_hash = JSON.parse(response_hash.to_str)
    File.open("index.html", "w") do |f|
        f.write("<html>\n")
        f.write("<head>\n")
        f.write("<link rel=\"stylesheet\" href=\"style.css\">\n")
        f.write("</head>\n")
        f.write("<body>\n")
        f.write("\t<ul>\n")
        ruby_hash['photos'].each { |photo| f.write("\t<li><img src=\"#{photo['img_src']}\" /></li>\n") }
        f.write("</ul>\n")
        f.write("</body>\n")
        f.write("</html>\n")
    end
end