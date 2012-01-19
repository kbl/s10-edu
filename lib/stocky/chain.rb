module Stocky
  class Chain

    UP = :up
    DOWN = :down

    # number of transitions is lower than number of elements
    TRANSITIONS = 1

    attr_reader :trend, :probability

    def initialize(input)
      @trend = input.each_cons(2).map do |early_price, late_price|
        early_price < late_price ? UP : DOWN
      end

      @probability = @trend
        .each_cons(2)
        .inject(Hash.new(0)) { |hash, trend_pair|
          hash[trend_pair] += 1
          hash
        }
        .inject(Hash.new(0)) { |hash, (key, count)|
          hash[key] = count / (@trend.length.to_f - TRANSITIONS)
          hash
        }
    end

    def predict(last_trend)
      [UP, DOWN].inject({}) do |hash, trend|
        key = [last_trend, trend]
        hash[trend] = @probability[key]
        hash
      end
    end

  end
end
