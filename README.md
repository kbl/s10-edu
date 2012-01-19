# Stocky
Prediction of stock options trend based on historical data.

# Usage
Stocky reads provided input and parses it searching historical data. It supports either files accessible locally or downloadable from internet.

    $ ./bin/stocky path/to/historical/data.txt

    $ ./bin/stocky http://url.to/historical.csv?data=1

## Input format
 * Data provided as an input must be in `CSV` format,
 * Newer data should be at the bottom of the file,
 * First row isnt relevant (header),
 * Trends about stock value are build from data available in 5th column (price of option at the end of the day),

# Output
Stocky provides simple output idicating probability of price being higher/lower than last one read from historical data.
