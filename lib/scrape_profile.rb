require 'nokogiri'
require 'open-uri'
require 'pry'

#getting data from page
student_data = Nokogiri::HTML(open('http://students.flatironschool.com/')) 

#setting links array
photos_arr = student_data.css("div.blog-thumb a img").collect do |photo|
  photo.attr("src").include?("http") ? photo.attr("src") : "http://students.flatironschool.com/#{photo.attr("src")}"
end

names_arr = student_data.css("div.big-comment a").collect do |name|
  name.text
end

photo_name_arr = photos_arr.zip(names_arr)



