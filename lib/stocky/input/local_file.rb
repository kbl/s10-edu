module Stocky
  module Input
    class LocalFile

      PRICE_COLUMN = 4

      attr_reader :input_data

      def initialize(path)
        @path = path
        proccess
      end

      private 

      def proccess
        @input_data = []
        begin
          CSV.foreach(@path, headers: true, converters: :float) do |row|
            @input_data << row[PRICE_COLUMN]
          end
        rescue
          raise WrongInputError
        end
      end

    end
  end
end