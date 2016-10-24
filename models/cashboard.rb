require_relative('../db/sql_runner')
require_relative('transaction')
require_relative('category')

class Cashboard

  def initialize(transactions)
    @transactions = transactions
  end

# use sprintf
  def totaller()
    running_total = 0
    for transaction in @transactions
      result = running_total += transaction.value
    end
    return result.round(2)
  end

  # def total_by_category()
  #   cashboard1 = Cashboard.new(@transactions)
  #   return cashboard1.totaller
  # end

end