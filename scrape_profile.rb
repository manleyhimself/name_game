require 'nokogiri'
require 'open-uri'
require 'pry'

#getting data from page
student_data = Nokogiri::HTML(open('http://students.flatironschool.com/')) 

#setting links array
photos_arr = student_data.css("div.blog-thumb a img").collect do |photo|
  photo.attr("src").include?("http") ? photo.attr("src") : "http://students.flatironschool.com/#{photo.attr("src")}"
end

binding.pry

# student_pages = links_array.collect do |link|
#   begin
#     Nokogiri::HTML(open(link))
#   rescue OpenURI::HTTPError => error # if it don't
#     if error.message == "404 Not Found"
#     else
#       raise error
#     end
#   end
# end.compact

# names = student_pages.collect do |student_page|
#   student_page.css("div.page-title h4").text
# end

# binding.pry

# new_pages.each do |new_page|
#   new_page.css("")
# end



