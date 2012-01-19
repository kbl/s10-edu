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
      chain = Chain.new(parse_input)
      [Chain::UP, Chain::DOWN].each do |last_trend| 
        prediction = chain.predict(last_trend)
        prediction.each do |trend, probability| 
          print "Probability %4s --> %4s = %1.4f\n" % 
            [last_trend, trend, probability]
        end
      end
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

      raise Input::WrongInputError
    end

  end
end
