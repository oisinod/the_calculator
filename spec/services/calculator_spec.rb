require 'calculator'

RSpec.describe Calculator do
  describe '.calculate' do
    context 'with valid operators' do
      it 'adds two numbers' do
        result = Calculator.calculate(3, '+', 5)
        expect(result).to eq(8)
      end

      it 'subtracts two numbers' do
        result = Calculator.calculate(8, '-', 3)
        expect(result).to eq(5)
      end

      it 'multiplies two numbers' do
        result = Calculator.calculate(4, '*', 6)
        expect(result).to eq(24)
      end

      it 'divides two numbers' do
        result = Calculator.calculate(10, '/', 2)
        expect(result).to eq(5)
      end

      it 'raises the number to a power of another' do
        result = Calculator.calculate(2, '^', 3)
        expect(result).to eq(8)
      end

      it 'calculates the square root of a number' do
        result = Calculator.calculate(nil, 'sqrt', 9)
        expect(result).to eq(3.0)
      end
    end

    context 'with invalid operators' do
      it 'raises an ArgumentError for an unknown operator' do
        expect {
          Calculator.calculate(3, '%', 5)
        }.to raise_error(ArgumentError, "Invalid operator '%'. Please use a valid operator. Allowed operators are +, -, *, /, ^, sqrt.")
      end
    end
  end
end
