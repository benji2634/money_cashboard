require_relative('../db/sql_runner')

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
    @id = transaction['id'].to_i
  end

  def self.all
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