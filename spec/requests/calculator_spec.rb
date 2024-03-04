require 'rails_helper'

RSpec.describe CalculatorController, type: :request do
  describe 'GET /calculator' do
    before do
      allow(Calculator).to receive(:calculate)
    end

    context 'with a valid expression' do
      it 'calls Calculator.calculate with the correct arguments for addition' do
        get '/calculator?expression=5+3'
        expect(Calculator).to have_received(:calculate).with(5, '+', 3)
      end

      it 'calls Calculator.calculate with the correct arguments for subtraction' do
        get '/calculator?expression=10-3'
        expect(Calculator).to have_received(:calculate).with(10, '-', 3)
      end

      it 'calls Calculator.calculate with the correct arguments for multiplication' do
        get '/calculator?expression=4*6'
        expect(Calculator).to have_received(:calculate).with(4, '*', 6)
      end

      it 'calls Calculator.calculate with the correct arguments for division' do
        get '/calculator?expression=10/2'
        expect(Calculator).to have_received(:calculate).with(10, '/', 2)
      end

      it 'calls Calculator.calculate with the correct arguments for exponentiation' do
        get '/calculator?expression=2%5E3'
        expect(Calculator).to have_received(:calculate).with(2, '%5E', 3)
      end

      it 'calls Calculator.calculate with the correct arguments for square root' do
        get '/calculator?expression=sqrt9'
        expect(Calculator).to have_received(:calculate).with(0, 'sqrt', 9)
      end
    end

    context 'with an invalid expression' do
      it 'does not call Calculator.calculate' do
        get '/calculator', params: { expression: 'invalid_expression' }
        expect(Calculator).not_to have_received(:calculate)
      end
    end
  end
end
