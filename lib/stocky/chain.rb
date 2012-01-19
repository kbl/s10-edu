module Stocky
  class Chain

    attr_reader :trend, :probability

    def initialize(input)
      @trend = input.each_cons(2).map do |early_price, late_price|
        early_price < late_price
      end

      @probability = @trend
        .each_cons(2)
        .inject(Hash.new(0)) do |hash, trend_pair|
          hash[trend_pair] += 1
          hash
        end
        .inject({}) do |hash, (key, count)|
          hash[key] = count / @trend.length
          hash
        end
    end

  end
end
