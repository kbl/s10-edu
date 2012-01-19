require 'minitest/autorun'
require_relative '../lib/stocky'

def path(filename)
  File.join(File.dirname(__FILE__), 'files', filename)
end
