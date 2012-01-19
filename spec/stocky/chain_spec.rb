require 'spec_helper'

module Stocky
  describe Chain do

    it 'should properly count trend' do
      chain = Chain.new([1, 2, 3, 4, 3, 2, 2, 4, 1, 3])
      chain.trend.must_equal [:up, :up, :up, :down, :down, :down, :up, :down, :up]
    end

    describe 'probability' do
      it 'is certain that will go up' do
        chain = Chain.new([1, 2, 3])
        chain.predict(:up).must_equal({up: 1, down: 0})
        chain.predict(:down).must_equal({up: 0, down: 0})
      end
      it 'is certain that will go down' do
        chain = Chain.new([3, 2, 1])
        chain.predict(:up).must_equal({up: 0, down: 0})
        chain.predict(:down).must_equal({up: 0, down: 1})
      end
    end

  end
end
