require_relative('../db/sql_runner')

class Category

  attr_reader :id, :type

  def initialize(options)
    @id = nil || options['id'].to_i
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO categories (type) 
    VALUES ('#{@type}') RETURNING *"
    category = SqlRunner.run(sql).first
    @id = category['id'].to_i
  end

  def merchants()
    sql = "SELECT merchants.* FROM merchants INNER JOIN transactions ON transactions.merchant_id = merchants.id WHERE transactions.category_id = #{@id}"
    return Merchant.map_items(sql)
  end

  def transactions()
    sql = "SELECT transactions.* FROM transactions INNER JOIN categories ON categories.id = transactions.category_id WHERE categories.type = '#{@type}'"
  return Transaction.map_items(sql)
  end

  def self.all(query = "")
    query = query.to_s.downcase
    sql = "SELECT * FROM categories"
    sql = sql + " WHERE LOWER(type) LIKE '%#{query}%'" unless query.empty?
    result = Category.map_items(sql)
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM categories WHERE id = #{id}"
    return Category.map_item(sql)
  end

  def self.update(options)
    sql = "UPDATE categories SET
          type = '#{options['type']}'
          WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM categories WHERE id= #{id}"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM categories"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    categories = SqlRunner.run(sql)
    result = categories.map { |category| Category.new(category) }
    return result 
  end

  def self.map_item(sql)
    result = Category.map_items(sql)
    return result.first
  end

end
