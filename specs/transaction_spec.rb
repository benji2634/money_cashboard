require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')

require_relative('../models/transaction')

class TestTransaction < Minitest::Test

  def setup
    options = {
      'value' => '25.23'
    }
    @transaction = Transaction.new(options)
  end

  def test_transaction_value
    assert_equal(25.23, @transaction.value())
  end

end
