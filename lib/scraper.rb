require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
  def get_page
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    @page = Nokogiri::HTML(html)
  end
  
  def get_courses
    self.get_page
    @courses = @page.css(".posts-holder")
  end
  
  def make_courses
    self.get_courses
    @courses.each do |course| 
      new_course = Course.new
      new_course.title = course
      new_course.schedule = course
      new_course.description = course
    end
  end
  
end



