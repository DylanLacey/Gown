require "gown/version"
require "gown/patterns"
require "tty-spinner"

module Gown

  class << self
    def strip_file input_filename, output_filename
      patterns_to_remove = (
        Gown::Patterns::KGP_lifecycle + 
        Gown::Patterns::KGP_warnings +
        Gown::Patterns::KGP_metadata +
        Gown::Patterns::KGP_traffic +
        Gown::Patterns::CHANNEL_events +
        Gown::Patterns::MAIN_lifecycle
      ).map {|pattern| Regexp.new (Gown::Patterns::Timestamp + pattern)}

      puts "Checking for #{patterns_to_remove.length} patterns"

      spinner = TTY::Spinner.new("[:spinner] Parsing #{input_filename}")
      begin

        lines_removed = 0

        spinner.auto_spin
        input = File.open input_filename
        input.advise(:sequential)

        output = File.new output_filename, "a"

        input.each do |line|
          filtered = patterns_to_remove.find { |pattern| pattern.match line }
          if !filtered
            output.puts line
          else
            lines_removed+= 1
          end
        end

        spinner.success " -- Removed #{lines_removed} lines"
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
