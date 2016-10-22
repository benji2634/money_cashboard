require_relative('../db/sql_runner')

class Category

  attr_reader :id, :type, :description

  def initialize(options)
    @id = nil || options['id'].to_i
    @type = options['type']
    @description = options['description']
  end

  def save()
    sql = "INSERT INTO categories (type, description) 
    VALUES ('#{@type}', '#{@description}') RETURNING *"
    category = SqlRunner.run(sql).first
    @id = category['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM categories"
    return Category.map_items(sql)
  end

  def self.find
    sql = "SELECT * FROM categories WHERE id = #{@id}"
    return Category.map_item(sql)
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
