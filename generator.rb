require_relative './environment'

scraper = StudentScraper.new("http://students.flatironschool.com/")

scraper.array.each do |student_arr|
  Student.new.tap do |s|
    s.name = student_arr[1]
    s.image = student_arr[0]
    s.save
  end
end

index_page = ERB.new(File.open('lib/student_templates/index.erb').read)
File.open("_site/index.html", "w+") << index_page.result(binding)

student_quiz = ERB.new(File.open('lib/student_templates/quiz.erb').read)
students = Student.all

students.each do |s|
  File.open("_site/students/#{s.url}", 'w+') do |f|
    f << student_quiz.result(binding)
  end
end

# binding.pry