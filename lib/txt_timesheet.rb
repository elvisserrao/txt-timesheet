files = []
i_files = 0
time_regex = /(?<hours>\d{2})\:(?<minutes>\d{2})/

# Percorre todos os arquivos na linha de comando
ARGV.each do|a|

  i = 0
  files[i_files] = a
  file = "../assets/#{a}"
  content_file = File.open(file)
  i_count = 0
  test = []


  # Percorre todas as linhas do arquivo de entrada para extrair os horários no formato hh:mm
  while ! content_file.eof?
    line = content_file.gets.chomp
    if time_regex.match(line)
      hours = time_regex.match(line)[:hours]
      minutes = time_regex.match(line)[:minutes]
      test.push(hours + ":" + minutes)
      i+=1
    end
  end



  i_count = test.count - i_count
  puts i_count
  content_file.close
  i_files+=1


  # itera pelo array de strings e converte para inteiros
  test.each do |a|
    a =  a.split(":")
    i=0
    inteiro = []
    a.each do |b|
      inteiro[i] = b.to_i
      i+=1
    end
  puts inteiro.inspect
  end

end




puts "REPORT:"
i_files = 0

#
# Mostra o nome dos arquivos lidos e o total de horas de cada um
#
files.each do |fls|
  print "#{fls } \n"
  i_files+=1
end