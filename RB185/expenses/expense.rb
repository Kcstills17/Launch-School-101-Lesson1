#! /usr/bin/env ruby

require "pg"
require "date"
require "io/console"

class ExpenseData
    def initialize
        @connection = PG.connect(dbname: "managed_expenses")
        setup_schema
    end

  def list_expenses
    result = @connection.exec("SELECT * FROM expenses ORDER BY created_on ASC")
    result.ntuples > 0 ? display_expenses(result) : display_count(result)

  end

  def add_expense(amount, memo)
    date = Date.today
    sql = "INSERT INTO expenses (amount, memo, created_on) VALUES ($1, $2, $3)"
    @connection.exec_params(sql, [amount, memo, date])
  end

  def search_expenses(query)
    sql = "SELECT * FROM expenses WHERE memo ILIKE $1"
    result = @connection.exec_params(sql, ["%#{query}%"])
    display_expenses(result)
  end


  def delete_expenses(identifier)
    # First, check if the expense with the given identifier exists
    delete_sql = "DELETE FROM expenses WHERE id = $1"
    @connection.exec_params(delete_sql, [identifier])
  end

  def delete_all_expenses
    delete_sql = "DELETE FROM expenses "
    @connection.exec(delete_sql)
  end





    def display_deleted_expense(identifier)
      sql = "SELECT * FROM expenses where id = $1"
      result = @connection.exec_params(sql, [identifier])
      if check_tuple_size?(result)
        puts "There is no expense with the id #{identifier}"
        return
      else
        puts "The following expense has been deleted"
      end
      display_expenses(result)
    end

  private

  def setup_schema
    result = @connection.exec("SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'expenses';")
    count = result.getvalue(0, 0).to_i  # Convert the first column of the first row to an integer

    if count == 1
      puts count
    else
      puts count
      create_schema
    end
  end

  def create_schema
    result = @connection.exec("CREATE TABLE expenses (
    id serial PRIMARY KEY,
    amount numeric(6, 2) NOT NULL CONSTRAINT valid_amount CHECK (amount >= 0.01),
    memo text NOT NULL,
    created_on date NOT NULL)
    ;"
    )
  end


  def check_tuple_size?(r)
   r.cmd_tuples.zero?
  end

  def display_count(tuples)
    if tuples.ntuples == 0
      puts "There are no expenses."
    elsif tuples.ntuples == 1
      puts "there is #{tuples.ntuples} expense."
    else
      puts "there are #{tuples.ntuples} expenses."
    end
  end




  def display_expenses(expenses)
    display_count(expenses)
    expenses.each do |tuple|
      columns = [ tuple["id"].rjust(3),
                  tuple["created_on"].rjust(10),
                  tuple["amount"].rjust(12),
                  tuple["memo"] ]

      puts columns.join(" | ")


    end
    puts "-" * 50

    amount_sum = expenses.field_values("amount").map(&:to_f).inject(:+)

    puts "Total #{format('%.2f', amount_sum.to_s).rjust(25)}"
  end
end

class CLI
  def initialize
    @application = ExpenseData.new
  end


  def run(arguments)
    command = arguments.shift
    case command
    when "add"
      amount = arguments[0]
      memo = arguments[1]
      abort "You must provide an amount and memo." unless amount && memo
      @application.add_expense(amount, memo)
    when "list"
      @application.list_expenses
    when "search"
      @application.search_expenses(arguments[0])
    when "delete"
      id = arguments[0]
      @application.display_deleted_expense(id)
      @application.delete_expenses(id)
    when "clear"
      clear
    else
      display_help
    end
  end

  private
  def clear
    puts "This will remove all expenses. Are you sure? (y/n)"
    answer = STDIN.getch.downcase
    if answer =='y'
      @application.delete_all_expenses
      puts "all applications have been deleted"
    else
      puts "Deletion attempt has been canceled. "
    end
  end


  def display_help
    puts <<~HELP
      An expense recording system

      Commands:

      add AMOUNT MEMO - record a new expense
      clear - delete all expenses
      list - list all expenses
      delete NUMBER - remove expense with id NUMBER
      search QUERY - list expenses with a matching memo field
    HELP
  end
end

CLI.new.run(ARGV)














