#!/usr/bin/env ruby
# Hacked together by Philip Cunningham
# http://philipcunningham.org

require 'rubygems'  
require 'nokogiri'  
require 'open-uri'  
require 'openssl'
require 'twitter'
require 'yaml'
require "shorturl"
require 'auth.rb'

#Set URL to parse
url = "https://8bc.org/index.php"  
doc = Nokogiri::HTML(open(url))  

#Specificy CSS path
results = doc.css("li.place-1").text  

#Parse song title
title1 = results.delete "\n"
title2 = title1.slice(0..(title1.index("by")))
title3 = title2.delete "by" 

#Parse artist name
author = title1
author1 = author.split("by")
author2 = author1[1].split("#")
author3 = author2[0]

#Specify link CSS path
link = doc.css("li.place-1 a").map { |link| link['href'] }

#Set linkvalue variable equal to value in array position 1
linkvalue = link[1]
linkvalue1 = "https://8bc.org/#{linkvalue}"
linkshort = ShortURL.shorten("#{linkvalue1}", :tinyurl)

#Put it all together in one string variable
update = "Last week's top track was '#{title3}' by#{author3}. #{linkshort}"

#Prints output for debug
puts update

#Send string to Twitter
Twitter.update("Last week's top track was '#{title3}' by#{author3}. #{linkshort}")
