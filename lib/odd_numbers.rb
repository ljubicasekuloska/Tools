# frozen_string_literal: true

module Tools
  class OddNumbers
    def initialize(input)
      @input_array = input
    end

    def first_odd_number
      all_odd_numbers.first
    end

    def all_odd_numbers
      a = []
      @input_array.each { |elem| a << elem if @input_array.count(elem).odd? }
      a.uniq
    end
  end
end
