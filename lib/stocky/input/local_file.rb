module Stocky
  module Input
    class LocalFile

      attr_reader :input_data

      def initialize(path)
        @path = path
        proccess
      end

      private 

      def proccess
        @input_data = []
        begin
          CSV.foreach(@path, Spec::CSV_OPTIONS) do |row|
            @input_data << row[Spec::PRICE_COLUMN]
          end
        rescue
          raise WrongInputError
        end
      end

    end
  end
end
