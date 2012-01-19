require_relative '../../spec_helper'

module Stocky
  module Input
    describe Web do

      it 'should properly parse input from file omiting header' do
        # This one is rather integration than unit spec
        # Failing probably means that there are problems with internet connection
        # or file was removed
        file = Web.new('http://marcin.pietraszek.pl/rmu/input.csv')
        file.input_data.must_equal [4.15, 4.05, 4.16]
      end

      it 'should throw wrong input type error on url passed' do
        proc do
          Web.new(path('input.csv'))
        end.must_raise WrongInputError
      end

    end
  end
end
