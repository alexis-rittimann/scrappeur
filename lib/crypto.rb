require 'nokogiri'
require 'open-uri'
require 'pry'
require 'rubygems'





page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

crypto_names = page.xpath("/html/body/div/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div/text()").map {|x| x.to_s }
crypto_prices = page.xpath("/html/body/div/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/a/text()").map {|x| x.to_s }

crypto_result = Hash[*crypto_names.zip(crypto_prices).flatten]
puts crypto_result
