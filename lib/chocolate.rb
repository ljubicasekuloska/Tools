# frozen_string_literal: true

module Tools
  class Chocolate
    def initialize(person1, person2)
      @sub_array1 = person1
      @sub_array2 = person2
    end

    def fairness?
      total_area(@sub_array1) == total_area(@sub_array2)
    end

    private

    def total_area(array)
      array.sum { |x, y| x * y }
    end
  end
end
