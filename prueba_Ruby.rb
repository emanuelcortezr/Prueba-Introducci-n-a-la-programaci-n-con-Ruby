
require 'rest-client'
require 'json'

api_key = '0Ws2ZgYUf25tTFiHmuyUPhqIvNlRNSTB3ODYu4Eo'
url_api_key = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=' + api_key

# Consumo de una API Rest con autenticaciÃ³n sencilla
response = RestClient.get(url_api_key)

