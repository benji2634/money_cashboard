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

  def self.all
    sql = "SELECT * FROM merchants"
    return Merchant.map_items(sql)
  end

  def self.find
    sql = "SELECT * FROM merchants WHERE id = #{@id}"
    return Merchant.map_item(sql)
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