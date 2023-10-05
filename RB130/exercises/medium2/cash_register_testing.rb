require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test

  def test_accept_money
      register = CashRegister.new(1000)
      transaction = Transaction.new(20)
      transaction.amount_paid = 20

      previous_amount = register.total_money
      register.accept_money(transaction)
      current_amount = register.total_money

      assert_equal previous_amount + 20, current_amount
  end


  def test_change
    current_buy = Transaction.new(50)
    current_buy.amount_paid = 100
    remaining_change = CashRegister.new(1000).change(current_buy)
    assert_equal(50, remaining_change)
  end

  def test_give_receipt
    def test_give_receipt
      cost = Transaction.new(500)
      register = CashRegister.new(50)

      # Capture stdout
      captured_output = StringIO.new
      $stdout = captured_output

      $stdout = STDOUT

      payment_statement = captured_output.string.chomp  # chomp to remove trailing newline
      assert_equal("You've paid $500.", payment_statement)
    end

  end

end



