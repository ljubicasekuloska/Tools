# frozen_string_literal: true

# require 'Tools/version'

module Tools
  class Luhn
    def initialize(str)
      @stripped = str.delete(' ')
    end

    def valid?
      return false if @stripped.length <= 1
      return false if /\D/.match?(@stripped)

      (rest_of_the_elements + checksum).sum % 10 == 0
    end

    private

    def checksum
      every_second_digit_from_right.map do |elem|
        double = elem * 2
        double > 9 ? double - 9 : double
      end
    end

    def every_second_digit_from_right
      indexes(1).map { |i| reversed_array[i].to_i }
    end

    def rest_of_the_elements
      indexes.map { |i| reversed_array[i].to_i }
    end

    def reversed_array
      @stripped.reverse.chars
    end

    def indexes(inx = 0)
      (inx..reversed_array.length - 1).step(2)
    end
  end

  class Raindrops
    def initialize(number)
      @number = number
    end

    def faktor
      out_string = ''
      out_string += 'Pling' if (@number % 3).zero?
      out_string += 'Plang' if (@number % 5).zero?
      out_string += 'Plong' if (@number % 7).zero?
      out_string.empty? ? @number.to_s : out_string
    end
  end

  class Allergies
    LIMIT = 512
    ALLERGENS = {
      1 => 'eggs',
      2 => 'peanuts',
      4 => 'shellfish',
      8 => 'strawberries',
      16 => 'tomatoes',
      32 => 'chocolate',
      64 => 'pollen',
      128 => 'cats'
    }.freeze

    def initialize(score)
      @score = score
    end

    def alergic_to?(allergen)
      list_of_allergies.include? allergen
    end

    def list_of_allergies
      all_allergens.map { |key| ALLERGENS[key] }
    end

    private

    def score
      @score -= LIMIT while @score >= LIMIT
      @score
    end

    def keys
      ALLERGENS.keys.select { |item| item <= score }.sort.reverse
    end

    def all_allergens
      tmp = score
      keys.select { |elem| tmp >= elem && tmp -= elem }
    end
  end

  class Resistors
    COLORS = {
      'Black' => 0,
      'Brown' => 1,
      'Red' => 2,
      'Orange' => 3,
      'Yellow' => 4,
      'Green' => 5,
      'Blue' => 6,
      'Violet' => 7,
      'Gray' => 8,
      'White' => 9,
      'Gold' => '-',
      'Silver' => '-'
    }.freeze

    def initialize(color1, color2, color3 = 'Black')
      @colors_array = [color1, color2, color3]
    end

    def match_input
      @colors_array.map { |key| COLORS[key] }
    end

    def output
      (0..match_input.size - 2).map { |i| match_input[i] }.join.to_i
    end
  end
end
