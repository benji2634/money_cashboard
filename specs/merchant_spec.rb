require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')

require_relative('../models/merchant')

class TestMerchant < Minitest::Test

  def setup()
    options = {
      'name' => 'Tesco',
      'location' => 'Bathgate',
      'website_url' => 'www.tesco.com'
    }
  @merchant = Merchant.new(options)

  end
  
  def test_merchant_name()
    assert_equal('Tesco', @merchant.name())
  end

  def test_merchant_location()
    assert_equal('Bathgate', @merchant.location())
  end

  def test_merchant_website_url()
    assert_equal('www.tesco.com', @merchant.website_url())
  end

end
