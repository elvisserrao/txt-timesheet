# frozen_string_literal: true

# Treat past files as a parameter and calculate total hours worked
class TxtTimesheet
  def convert(par)
    ### Convert working time to hh:mm format
    hours = par / 60
    hours = hours.to_i
    minutes = par - hours * 60
    ## Add 0 to keep hh: mm format
    hours = "0#{hours}" if hours < 10
    minutes = "0#{minutes}" if minutes < 10

    time = "#{hours}:#{minutes}"

    time
  end

  def run
    time_regex = /(?<hours>\d{2})\:(?<minutes>\d{2})/
    total_time = 0

    puts 'REPORT:'
    #### Receive all files indicated on the command line
    ARGV.each do |a|
      sum_time = 0
      index = 0
      files = a
      file = a.to_s
      content_file = File.open(file)
      input_count = 0
      time = []
      time_in_min = []

      ### Read all lines from the input file to extract data
      until content_file.eof?
        line = content_file.gets.chomp
        next unless time_regex.match(line)

        hours = time_regex.match(line)[:hours]
        minutes = time_regex.match(line)[:minutes]
        time.push(hours + ':' + minutes)
        index += 1
      end
      input_count = time.count - input_count # count records in each file
      content_file.close
      ###

      ### iterates over string array and converts to integers
      index = 0
      integer = []
      i_parse_int = input_count * 2
      time.each do |entry_time|
        entry_time = entry_time.split(':')
        entry_time.each do |entry_time_to_integer|
          integer.push(entry_time_to_integer.to_i)
        end
      end
      ###

      ### Converts to minutes
      while index < i_parse_int
        time_to_min = integer[index]
        time_to_min *= 60
        time_to_min += integer[index + 1]
        time_in_min.push(time_to_min)
        index += 2
      end
      ###

      ### Calcula o tempo trabalhado em minutos
      index = 0
      while index < input_count
        sum_time = time_in_min[index + 1] - time_in_min[index] + sum_time
        i += 2
      end
      ###

      time_file = convert(sum_time)
      print "#{files}: #{time_file} hours\n"
      ###

      total_time += sum_time # Acumulates the worked time of each file
    end

    time_file = convert(total_time)

    puts "Total Hours: #{time_file} hours\n"
    ###

    ####
  end
end
