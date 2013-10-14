require_relative './environment'

photo_name_arr.each do |student_arr|
  Student.new tap do |s|
    s.name = student_arr[1]
    s.image = student_arr[0]
    s.save
  end
end



# index = ERB.new(File.open('lib/templates/index.erb').read)
# dogs = Dog.all

# File.open('_site/index.html', 'w+') do |f|
#   f << index.result(binding)
# end

# show = ERB.new(File.open('lib/templates/show.erb').read)
# # For each dog, first, cast the dog into instance var

# dogs.each do |dog|
#   File.open("_site/dogs/#{dog.url}.html", 'w+') do |f|
#     f << show.result(binding)
#   end
# end
