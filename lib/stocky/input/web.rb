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
          uri = URI.parse(@url)
          csv_string = uri.read
          CSV.parse(csv_string, Spec::CSV_OPTIONS) do |row|
            @input_data << row[Spec::PRICE_COLUMN]
          end
        rescue
          raise WrongInputError
        end
      end

    end
  end
end
