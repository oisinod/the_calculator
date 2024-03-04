class CalculatorController < ApplicationController

  EXPRESSION_REGEX = /(\d*)([\+\-\*\/\^]|sqrt|%5E)(\d+)$/

  def calculate
    result = Calculator.calculate(*calculation)
    render json: { result: result, expression: match_data[0] }

  rescue ArgumentError => e
    render json: { error: e.message }, status: :unprocessable_entity

  end

  private

  def match_data
    request.original_fullpath.match(EXPRESSION_REGEX)
  end

  def calculation
    if match_data
      first_number = match_data[1].to_i
      operator = match_data[2]
      second_number = match_data[3].to_i

      [first_number, operator, second_number]
    else
      raise ArgumentError, 'Invalid expression format'
    end
  end
end
