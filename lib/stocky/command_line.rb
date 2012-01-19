module Stocky
  class CommandLine

    INPUT_PROCESSORS = [
      Stocky::Input::LocalFile,
      Stocky::Input::Web
    ]

    def initialize(input_source)
      @input_source = input_source
    end

    def execute
      p parse_input
    end

    private 

    def parse_input
      INPUT_PROCESSORS.each do |processor|
        begin
          return processor.new(@input_source).input_data
        rescue Input::WrongInputError
          next
        end
      end

      nil
    end

  end
end
