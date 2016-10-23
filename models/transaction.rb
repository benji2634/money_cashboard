require_relative('../db/sql_runner')
require('pry-byebug')

class Transaction

  attr_reader :id, :merchant_id, :category_id, :value

  def initialize(options)
    @id = options['id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @category_id = options['category_id'].to_i
    @value = options['value'].to_f
  end

  def save()
    sql = "INSERT INTO transactions (merchant_id, category_id, value) 
    VALUES (#{@merchant_id}, #{@category_id}, #{@value}) RETURNING *"
    transaction = SqlRunner.run(sql).first
    @id = transaction['id']
  end

  def merchant()
    sql = "SELECT * FROM merchants WHERE id = #{merchant_id}"
    return Merchant.map_item(sql)
  end

  def category()
    sql = "SELECT * FROM categories WHERE id = #{category_id}"
    return Category.map_item(sql)
  end

  def self.total_spend()
    transactions = Transaction.all
    running_total = 0
    for transaction in transactions
      result = running_total += transaction.value
    end
    return result.round(2)
    # result = transactions.collect { |transaction| running_total += transaction.value }
    # return result
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    return Transaction.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = #{id}"
    return Transaction.map_item(sql)
  end

  def self.delete_all
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    transactions = SqlRunner.run(sql)
    result = transactions.map { |transaction| Transaction.new(transaction) }
    return result 
  end

  def self.map_item(sql)
    result = Transaction.map_items(sql)
    return result.first
  end

end