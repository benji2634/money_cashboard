class Merchant

  attr_reader :id, :name, :location, :website_url

  def initialize(options)
    @id = nil || options['id'].to_i
    @name = options['name']
    @location = options['location']
    @website_url = options['website_url']
  end

end