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
  time = []
  sum_time = []


  # Percorre todas as linhas do arquivo de entrada para extrair os horários no formato hh:mm
  while ! content_file.eof?
    line = content_file.gets.chomp
    if time_regex.match(line)
      hours = time_regex.match(line)[:hours]
      minutes = time_regex.match(line)[:minutes]
      time.push(hours + ":" + minutes)
      i+=1
    end
  end



  i_count = time.count - i_count # Conta quantas registros tem em cada arquivo
  content_file.close
  i_files+=1

  puts time.inspect
  i = 0
  inteiro = []
  # itera pelo array de strings e converte para inteiros
  i_count= i_count * 2
  time.each do |a|
    a =  a.split(":")
    a.each do |b|
      inteiro.push(b.to_i)
    end

  end
  while i < i_count
    hrs = inteiro[i]
    hrs = hrs * 60
    hrs = hrs + inteiro[i+1]
    sum_time.push(hrs)
    i+=2
    puts hrs.inspect
  end
  # puts inteiro.inspect
  # puts sum_time.inspect
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