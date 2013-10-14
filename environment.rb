require 'erb'
require 'sqlite3'
require 'nokogiri'
require 'open-uri'

require 'pry'

require_relative './lib/student_class'
require_relative './lib/scrape_profile.rb'

File.directory?("./_site/students") ? true : Dir.mkdir("./_site/students",0755)