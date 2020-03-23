require "Tools/version"

module Tools
  class Luhn
    attr_accessor :str, :niza
    def initialize(str)
      @str = str
      @niza = []
    end

    def check_length # proveruva dolzina na string, prethodno otstranuva prazni mesta
      delete_space
      return false if @str.length <= 1

      true
    end

    def check_onlynumbers # proveruva dali se vneseni samo broevi
      delete_space
      return true if str.scan(/\D/).empty?

      false
    end

    def delete_space # metod koj brise prazni mesta
      @str = str.delete(' ')
    end

    def luhn_calc # validacija dali e luhn broj spored zadadenite parametri, vrakja true, false
      count = 1
      if valid?
        @niza = str.chars.reverse.map(&:to_i)
        while count < @niza.length
          @niza[count] = @niza[count] * 2
          @niza[count] = @niza[count] - 9 if @niza[count] > 9
          count += 2
        end
        sum = @niza.sum
        return true if sum % 10 == 0

        false
      else false
      end
    end

    def valid? # metod koj proveruva dali vneseniot string e validen soglasno zadadenite paramerti
      return true if check_length && check_onlynumbers

      false
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
end
