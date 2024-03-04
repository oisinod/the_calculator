class Calculator
  class << self
    def calculate(first, operator, second)
      first = first&.to_f
      second = second&.to_f

      operator = decode_operator(operator) if operator == '%5E'

      case operator
      when '+'
        first + second
      when '-'
        first - second
      when '*'
        first * second
      when '/'
        second.zero? ? nil : first / second
      when '^'
        first ** second
      when 'sqrt'
        Math.sqrt(second)
      else
        raise ArgumentError, "Invalid operator '#{operator}'. Please use a valid operator. Allowed operators are +, -, *, /, ^, sqrt."
      end
    end

    def decode_operator(operator)
      CGI.unescape(operator)
    end
  end
end
