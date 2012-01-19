module Stocky
  describe Chain do

    it 'should properly count trend' do
      chain = Chain.new([1, 2, 3, 4, 3, 2, 2, 4, 1, 3])
      chain.trend.must_equal [true, true, true, false, false, false, true, false, true]
    end

    it 'should properly count probability' do
      chain = Chain.new([1, 2, 3, 4, 3, 2, 2, 4, 1, 3, 2])
      chain.trend.must_equal [true, true, true, false, false, false, true, false, true, false]
      chain.probability.must_equal []
    end

  end
end
