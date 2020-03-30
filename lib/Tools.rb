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
      @list_all_allergies = []
    end

    def alergic_to?(allergen)
      all_allergens
      @list_all_allergies.include? allergen
    end

    def list_of_allergies
      all_allergens
      @list_all_allergies
    end

    private

    def all_allergens
      score = @score
      score -= 256 while score >= 256
      x = ALLERGENS.keys.reverse
      x.each do |i|
        if i <= score
          score -= i
          @list_all_allergies.push ALLERGENS[i]
        end
      end
    end
  end
end
