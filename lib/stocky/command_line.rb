module Stocky
  module CommandLine

    WrongInputError = Class.new(RuntimeError)

    INPUT_PROCESSORS = [
      Stocky::Input::LocalFile,
      Stocky::Input::Web
    ]

    def self.execute(command_line_argument)
      input = INPUT_PROCESSORS.each do |processor|
        processor.new(command_line_argument).input_data
        break
      end
      p input
    end

  end
end
