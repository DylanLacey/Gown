require "gown/version"
require "gown/patterns"
require "tty-spinner"

module Gown

  class << self
    def patterns
      patterns_to_remove = (
        Gown::Patterns::KGP_lifecycle + 
        Gown::Patterns::KGP_warnings +
        Gown::Patterns::KGP_metadata +
        Gown::Patterns::KGP_traffic +
        Gown::Patterns::CHANNEL_events +
        Gown::Patterns::MAIN_lifecycle
      ).map {|pattern| Regexp.new (Gown::Patterns::Timestamp + pattern)}

      return patterns_to_remove
    end

    def strip input
      patterns_to_remove = patterns
      output = ""

      input.each do |line|
      if line.match /^[[:space:]]*$/
        # blank_lines_removed +=1
      else
        filtered = patterns_to_remove.find { |pattern| pattern.match line }
        if !filtered
          output.append line
        else
          # lines_removed+= 1
        end
      end

      return output
    end

    def strip_file input_filename, output_filename
      patterns_to_remove = patterns

      puts "Checking for #{patterns_to_remove.length} patterns"

      spinner = TTY::Spinner.new("[:spinner] Parsing #{input_filename}")
      begin

        lines_removed = 0
        blank_lines_removed = 0

        spinner.auto_spin
        input = File.open input_filename
        input.advise(:sequential)

        output = File.new output_filename, "a"

        input.each do |line|
          if line.match /^[[:space:]]*$/
            blank_lines_removed +=1
          else
            filtered = patterns_to_remove.find { |pattern| pattern.match line }
            if !filtered
              output.puts line
            else
              lines_removed+= 1
            end
          end
        end

        status = " -- Removed #{lines_removed} lines"
        status << ", #{blank_lines_removed} blank lines" if blank_lines_removed > 0
        spinner.success status
      rescue => e
        spinner.error "Something dire happened!"
        puts e
      ensure
        input.close if input
        output.close if output
      end
    end
  end
end
