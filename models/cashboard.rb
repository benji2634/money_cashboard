require_relative('../db/sql_runner')
require_relative('transaction')

class Cashboard

  def initialize(transactions)
    @transactions = transactions
  end

# use sprintf
  def total_spend()
    running_total = 0
    for transaction in @transactions
      result = running_total += transaction.value
    end
    return result.round(2)
  end

  # SELECT categories.type FROM categories INNER JOIN transactions ON transactions.category_id = categories.id;
  # def self.total_spend_by_category
  #   transactions = Transaction.all
  #   running_total = 0
  #   for transaction in transactions
  #     result = running_total += transaction.value
  #   end
  #   return result.round(2)
  # end

end