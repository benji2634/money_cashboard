require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')

require_relative('../models/category')

class TestCategory < MiniTest::Test

  def setup()
    options = {
      'type' => 'food'
    }
    @category = Category.new(options)
  end

  def test_category_type
    assert_equal('food', @category.type())
  end

end