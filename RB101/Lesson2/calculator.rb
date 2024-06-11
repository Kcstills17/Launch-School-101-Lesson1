# frozen_string_literal: true

# calculator
lANGUAGE = 'en'
require 'yaml'
MESSAGES = YAML.load_file(File.join(File.dirname(__FILE__), 'calculator_messages.yml')


def messages(message, lang = 'en')
  MESSAGES[lang][message]
end
puts "#{messages('welcome', 'jap')}"

loop do
  def valid_number?(input_string)
    input_string.to_i.to_s == input_string
  end

  def number(input_string)
    input_string.to_f.to_s == input_string
  end

  number1 = nil

  loop do
    Kernel.puts('What is your number')
    number1 = Kernel.gets.chomp
    break if valid_number?(number1) || number(number1)

    puts 'Please choose a valid number'
  end

  number2 = nil
  loop do
    puts('What is your second number')
    number2 = gets.chomp
    break if valid_number?(number2) || number(number2)

    puts 'Please choose a valid number'
  end

  operator_message = <<-MSG
  Choose your operation
  1.Add
  2.Subtract
  3.Multiply
  4.Divide
  MSG
  Kernel.puts(operator_message.to_s)
  operator = nil

  loop do
    operator = gets.chomp
    break if %w[1 2 3 4].include?(operator)

    puts('Please choose between 1 and 4')
  end

  case operator
  when  '1'
    puts "#{number1} + #{number2} = #{number1.to_f + number2.to_f}"
  when  '2'
    puts "#{number1} - #{number2} = #{number1.to_f - number2.to_f}"
  when  '3'
    puts "#{number1} * #{number2} = #{number1.to_f * number2.to_f}"
  when  '4'
    puts " #{number1} / #{number2} = #{number1.to_f / number2.to_f}"
  end

  puts 'Would you like to play again? if so please enter Y'
  answer = gets.chomp

  break if answer.downcase != 'y'
end
puts "#{messages("goodbye", 'jap')}"
