class Category

  attr_reader :id, :type, :description

  def initialize(options)
    @id = nil || options['id'].to_i
    @type = options['type']
    @description = options['description']
  end
end