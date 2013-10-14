require 'nokogiri'
require 'open-uri'
require 'pry'

class StudentScraper
  attr_accessor :array, :student_data

  def initialize(url)
    @student_data = Nokogiri::HTML(open(url))
    zip_arrays(get_images, get_names)
  end

  def get_images
    image_arr = @student_data.css("div.blog-thumb a img").collect do |photo|
      photo.attr("src").include?("http") ? photo.attr("src") : "http://students.flatironschool.com/#{photo.attr("src")}"
    end

  end

  def get_names
    names_arr = @student_data.css("div.big-comment a").collect do |name|
      name.text
    end
  end

  def zip_arrays(a1, a2)
    @array = a1.zip(a2)
  end
end