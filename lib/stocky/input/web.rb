module Stocky
  module Input
    class Web

      attr_reader :input_data

      def initialize(url)
        @url = url
        proccess
      end

      private 

      def proccess
        @input_data = []
        begin
          CSV.foreach(@path, headers: true, converters: :float) do |row|
            @input_data << row[Spec::PRICE_COLUMN]
          end
        rescue
          raise WrongInputError
        end
      end

    end
  end
end
