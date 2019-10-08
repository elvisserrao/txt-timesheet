files = []
hours = []
ihours = {}
iminutes = {}
minutes = []
i_files = 0
# time_re = /\d{2}:\d{2}/
init = /(?<hours>\d{2})\:(?<minutes>\d{2})/

ARGV.each do|a|
  i = 0
  files[i_files] = a
  file = "assets/#{a}"
  content_file = File.open(file)
  while ! content_file.eof?
    line = content_file.gets.chomp
    if init.match(line)
      hours[i] = init.match(line)[:hours]
      minutes[i] = init.match(line)[:minutes]
      i+=1
    end

  end
  ihours["#{i_files}"] = "#{hours}"
  iminutes["#{i_files}"] = "#{minutes}"
  content_file.close
  i_files+=1
end
i_files = 0

puts "REPORT:"
files.each do |fls|
  print "#{fls} "
  print "#{ihours["#{i_files}"]}"
  puts "#{iminutes["#{i_files}"] }"
  i_files+=1
end


# hora = []
# i = 0
# ihours.values_at("#{i}").each do |a|
#   hora.push(a)
#   puts hora[i]
#   i+=1
# end