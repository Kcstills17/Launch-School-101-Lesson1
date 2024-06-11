# formula m = p * (j / (1 - (1 + j)**(-n)))
require 'yaml'
MESSAGES = YAML.load_file('mortgage_car_loan_calculator_messages.yml')

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end
puts messages('Welcome', 'en').to_s
loop do
  def valid_float?(string_text)
    /\d/.match(string_text) && /^-?\d*\.?\d*$/.match(string_text)
  end

  def valid_number?(string_text)
    /^-?\d+$/.match(string_text)
  end

  gets.chomp
  loan_amount = nil
  loop do
    puts messages('loan_amount', 'en').to_s
    loan_amount = gets.chomp
    if loan_amount.to_i < 0
      puts messages('enter_positive_number', 'en').to_s
    else
      break if valid_float?(loan_amount) || valid_number?(loan_amount)
      puts messages('enter_valid_rate', 'en').to_s
    end
  end
  annual_percentage_rate = nil
  monthly_rate = nil
  loop do
    puts "#{messages('annual_percetnage_rate', 'en')} "
    annual_percentage_rate = gets.chomp
    if annual_percentage_rate.to_f < 0
      puts messages('enter_positive_rate', 'en').to_s
    else
      monthly_rate = annual_percentage_rate.to_f / 100 / 12

      break if valid_float?(annual_percentage_rate) || valid_number?(annual_percentage_rate)
      puts messages('enter_valid_rate', 'en').to_s
    end
  end
  loan_in_years = nil
  loan_in_months = nil
  loop do
    puts " #{messages('loan_duration_years', 'en')} "
    loan_in_years = gets.chomp
    loan_in_months = loan_in_years.to_i * 12
    if loan_in_years.to_f < 0
      puts messages('enter_positive_number', 'en').to_s
    else
      break if valid_float?(loan_in_years) || valid_number?(loan_in_years)
      puts messages('enter_valid_years', 'en').to_s
    end
  end

  puts messages('peform_calcs', 'en').to_s
  puts messages('calcs_completed', 'en').to_s
  monthly_rate = loan_amount.to_f * (monthly_rate / (1 - (1 + monthly_rate)**(-loan_in_months.to_f)))
  puts "#{messages('calculated', 'en')}$#{format('%.2f', monthly_rate)}"

  puts messages('end_of_calculator', 'en').to_s

  end_of_calculator = gets.chomp

  break unless end_of_calculator == 'y'.downcase
end

