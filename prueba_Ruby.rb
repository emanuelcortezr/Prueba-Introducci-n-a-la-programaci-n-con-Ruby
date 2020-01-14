require 'rest-client'
require 'json'

api_key = '0Ws2ZgYUf25tTFiHmuyUPhqIvNlRNSTB3ODYu4Eo'
url_api_key = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=' + api_key

# Consumo de una API Rest con autenticaciÃ³n sencilla
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

def count_photos(response_hash)
    ruby_hash = JSON.parse(response_hash.to_str)

    hash_camera = { 
        "FHAZ" => 0, 
        "RHAZ" => 0, 
        "MAST" => 0,
        "CHEMCAM" => 0,		
        "MAHLI"	=> 0,
        "MARDI"	=> 0,
        "NAVCAM" => 0,
        "PANCAM" => 0,
        "MINITES"=> 0,
    }

    ruby_hash['photos'].each do |i|
        camera_name = i['camera']['name'] # "FHAZ"
        hash_camera[camera_name] = hash_camera[camera_name] + 1
    end

    return hash_camera
end

build_web_page(response)
puts count_photos(response)