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

end
