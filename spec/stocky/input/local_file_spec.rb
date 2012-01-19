require 'spec_helper'

module Stocky
  module Input
    describe LocalFile do

      it 'should properly parse input from file omiting header' do
        file = LocalFile.new(path('input.csv'))
        file.input_data.must_equal [4.15, 4.05, 4.16]
      end

    end
  end
end
