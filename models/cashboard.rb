require_relative('../db/sql_runner')
require_relative('transaction')
require_relative('category')

class Cashboard

  def initialize(transactions)
    @transactions = transactions
  end

  def totaller()
    running_total = 0
    for transaction in @transactions
      result = running_total += transaction.value
    end
    return result if result == !nil
    return running_total
  end

end