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
      black: {
        color: 0,
        multiplier: 1,
        tolerance: 20
      },
      brown: {
        color: 1,
        multiplier: 10,
        tolerance: 1
      },
      red: {
        color: 2,
        multiplier: 100,
        tolerance: 2
      },
      orange: {
        color: 3,
        multiplier: 1000,
        tolerance: 0.2
      },
      yellow: {
        color: 4,
        multiplier: 10_000,
        tolerance: 0.05
      },
      green: {
        color: 5,
        multiplier: 100_000,
        tolerance: 0.5
      },
      blue: {
        color: 6,
        multiplier: 1_000_000,
        tolerance: 0.25
      },
      violet: {
        color: 7,
        multiplier: 10_000_000,
        tolerance: 0.10
      },
      gray: {
        color: 8,
        multiplier: 100_000_000,
        tolerance: 0.05
      },
      white: {
        color: 9,
        multiplier: 1_000_000_000,
        tolerance: 10
      },
      gold: {
        multiplier: 0.1,
        tolerance: 5
      },
      silver: {
        multiplier: 0.01,
        tolerance: 10
      }
    }.freeze

    def initialize(colors)
      @color1, @color2, @multiplier, @tolerance = colors
    end

    def base
      color(@color1) * 10 + color(@color2)
    end

    def specification
      "#{base * multiplier} ohms +/- #{tolerance}%"
    end

    private

    def multiplier
      COLORS[@multiplier.downcase.to_sym][:multiplier]
    end

    def tolerance
      @tolerance.nil? ? 20 : COLORS[@tolerance.downcase.to_sym][:tolerance]
    end

    def color(color_key)
      COLORS[color_key.downcase.to_sym][:color]
    end
  end
end
