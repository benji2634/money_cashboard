require_relative('../db/sql_runner')

class Merchant

  attr_reader :id, :name, :location, :website_url

  def initialize(options)
    @id = nil || options['id'].to_i
    @name = options['name']
    @location = options['location']
    @website_url = options['website_url']
  end

  def save()
    sql = "INSERT INTO merchants (name, location, website_url) 
    VALUES ('#{@name}', '#{@location}', '#{@website_url}') RETURNING *"
    merchant = SqlRunner.run(sql).first
    @id = merchant['id'].to_i
  end

  def categories()
    sql = "SELECT categories.* FROM categories INNER JOIN transactions ON transactions.category_id = categories.id WHERE transactions.merchant_id = #{@id}"
    return Category.map_items(sql)
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    return Merchant.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = #{id}"
    return Merchant.map_item(sql)
  end

  def self.update(options)
    sql = "UPDATE merchants SET
          name = '#{options['name']}',
          location = '#{options['location']}',
          website_url = '#{options['website_url']}'
          WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    merchants = SqlRunner.run(sql)
    result = merchants.map { |merchant| Merchant.new(merchant) }
    return result 
  end

  def self.map_item(sql)
    result = Merchant.map_items(sql)
    return result.first
  end
end