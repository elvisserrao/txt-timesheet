# frozen_string_literal: true

require 'time'
# Treat passed files as parameters and calculates total hours worked

class TxtTimesheet
  def initialize
    @can_parse = false
  end

  def can_parse?
    @can_parse
  end

  def set_can_parse(line)
    if @can_parse
      @can_parse = false if line.start_with? '## '
    else
      @can_parse = true if line.start_with? '## Timesheet'
    end
  end

  def process_file(filename)
    time_regex = /(?<hours>\d+)\:(?<minutes>\d+)/
    sum_time = 0
    index = 0
    content_file = File.open(filename)
    time = []
    time_in_sec = []

    ### Read all lines from the input file to extract data
    until content_file.eof?
      line = content_file.gets.chomp
      set_can_parse(line)

      if line.match(/^description:/)
        phrase = line.split(':')[1]
      end

      next unless can_parse?

      next unless time_regex.match(line)

      time << time_regex.match(line)
      time_in_sec << Time.parse(time.last.to_s)
    end

    while index < time.count

      sum_time = time_in_sec[index + 1] - time_in_sec[index] + sum_time
      index += 2
    end
    ###
    total_sec = sum_time

    {
      file_name: filename,
      file_time: total_sec,
      phrase: phrase
    }
  end

  def process_results(results = [])
    output = []
    total = []
    total_time = 0
    output << 'REPORT:'

    results.each do |result|
      file_name = result[:file_name]
      time_file = result[:file_time]
      total_time += time_file
      phrase = result[:phrase]
      time_file = Time.at(time_file).utc
      output << "#{file_name}: #{time_file.strftime('%H:%M')} hours -#{phrase}"

      # total_time = result[:file_time]
    end
    total = total_time.divmod(3600)
    total[1] /= 60
    total[1] = total.last.to_i
    output << format("Total Hours: %02d:%02d hours\n", total[0],total[1])

    output
  end

  def run
    results = []
    ARGV.each do |arg|
      results << process_file(arg)
    end
    output = process_results(results)
    puts output.join "\n"
  end
end
