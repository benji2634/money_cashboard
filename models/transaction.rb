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

end