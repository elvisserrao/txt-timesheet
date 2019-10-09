files = []
hours = []
test = []
ihours = {}
iminutes = {}
minutes = []
i_files = 0
time_regex = /(?<hours>\d{2})\:(?<minutes>\d{2})/

# Percorre todos os arquivos passados como argumento na linha de comando
ARGV.each do|a|
  i = 0
  files[i_files] = a
  file = "assets/#{a}"
  content_file = File.open(file)

  # Percorre todas as linhas do arquivo de entrada para extrair os horários no formato hh:mm
  while ! content_file.eof?
    line = content_file.gets.chomp
    if time_regex.match(line)
      hours[i] = time_regex.match(line)[:hours]
      minutes[i] = time_regex.match(line)[:minutes]
      test.push(hours[i] + ":" + minutes[i])
      i+=1
    end
  end

  # ihours["#{i_files}"] = "#{hours}"
  # iminutes["#{i_files}"] = "#{minutes}"
  content_file.close
  i_files+=1
end

puts "REPORT:"
i_files = 0

# Mostra o nome dos arquivos lidos e o total de horas de cada um
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