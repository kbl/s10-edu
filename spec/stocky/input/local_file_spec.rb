require_relative '../../spec_helper'

module Stocky
  module Input
    describe LocalFile do

      it 'should properly parse input from file omiting header' do
        file = LocalFile.new(path('input.csv'))
        file.input_data.must_equal [4.15, 4.05, 4.16]
      end

      it 'should throw wrong input type error on url passed' do
        proc do
          LocalFile.new('http://test.com/input.csv')
        end.must_raise WrongInputError
      end

    end
  end
end
