class Txt_timesheet

  def convert (par)
    ### Converte o tempo trabalhado para o formato hh:mm
    hours = par/60
    hours = hours.to_i
    minutes = par - hours * 60
    ## Adiciona o 0 para manter o padrão de 2 algarismos do padrão hh:mm
    if hours < 10
      hours = "0#{hours}"
    end
    if minutes < 10
      minutes = "0#{minutes}"
    end

    time = "#{hours}:#{minutes}"

    return time

  end

  def run
    time_regex = /(?<hours>\d{2})\:(?<minutes>\d{2})/
    total_time = 0

    puts "REPORT:"
  #### Percorre todos os arquivos na linha de comando
    ARGV.each do |a|
      sum_time = 0
      i = 0
      files = a
      file = "assets/#{a}"
      content_file = File.open(file)
      i_count = 0
      time = []
      time_to_min = []

      ### Percorre todas as linhas do arquivo de entrada para extrair os horários no formato hh:mm
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
      ###

      ### itera pelo array de strings e converte para inteiros
      i = 0
      inteiro = []
      i_parse_int = i_count * 2
      time.each do |a|
        a =  a.split(":")
        a.each do |b|
          inteiro.push(b.to_i)
        end
      end
      ###

      ### Converte cada horário para minutos
      while i < i_parse_int
        hrs = inteiro[i]
        hrs = hrs * 60
        hrs = hrs + inteiro[i+1]
        time_to_min.push(hrs)
        i+=2
      end
      ###

      ### Calcula o tempo trabalhado em minutos
      i = 0
      while i < i_count
        sum_time = time_to_min[i+1] - time_to_min[i] + sum_time
        i+=2
      end
      ###

      time_file = convert(sum_time)
      print "#{files}: #{time_file} hours\n"
      ###

      total_time += sum_time # Acumulates the worked time of each file

    end

    time_file = convert(total_time)
    ### Converts the total worked time
    hours = total_time/60
    hours = hours.to_i
    minutes = total_time - hours * 60
    puts "Total Hours: #{time_file} hours\n"
    ###


    ####
  end
end
