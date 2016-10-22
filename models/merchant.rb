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

end