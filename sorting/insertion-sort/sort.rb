require_relative '../shared/validator'
require_relative '../shared/exchanger'
require_relative '../shared/comparator'

##
# Implementation of sort using {https://pt.wikipedia.org/wiki/Insertion_sort} algorithm

module Insertion
  class Sort
    def initialize
      @comparator = Comparator.new
      @exchanger = Exchanger.new
    end

    def sort(values)
      _sort(values, 0)
    end

    private
    def _sort(values, index)
      return values if Validator.invalid?(values) or values.size == index
      values = sort_back(values, index, prev_(index))
      _sort(values, next_(index))
    end

    def sort_back(values, lowest, previus)
      return values if previus < 0

      if @comparator.this(values[previus]).greater_than?(values[lowest])
        values = @exchanger.exchange(values, previus, lowest)
        lowest = previus
      end

      sort_back(values, lowest, prev_(previus))
    end

    def prev_(pointer)
      pointer - 1
    end

    def next_(pointer)
      pointer + 1
    end

  end
end
