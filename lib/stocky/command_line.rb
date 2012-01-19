module Stocky
  module CommandLine

    INPUT_PROCESSORS = [
      Stocky::Input::LocalFile,
      Stocky::Input::Web
    ]

    def self.execute(command_line_argument)
      p parse_input(command_line_argument)
    end

    private 

    def self.parse_input(input_source)
      INPUT_PROCESSORS.each do |processor|
        begin
          return processor.new(input_source).input_data
        rescue Input::WrongInputError
          next
        end
      end

      nil
    end

  end
end
