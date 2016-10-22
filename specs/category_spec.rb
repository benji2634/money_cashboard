require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')

require_relative('../models/category')

class TestCategory < MiniTest::Test

  def setup()
    options = {
      'type' => 'food',
      'description' => 'weekly shop'
    }
    @category = Category.new(options)
  end

  def test_category_type
    assert_equal('food', @category.type())
  end

  def test_catgory_description
    assert_equal('weekly shop', @category.description())
  end

end