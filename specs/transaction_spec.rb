require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')

require_relative('../models/transaction')

class TestTransaction < Minitest::Test

  def setup
    options = {
      'value' => '25.23',
      # 'invalid_value' => '25.2342'
    }
    @transaction = Transaction.new(options)
  end

  def test_transaction_value
    assert_equal(25.23, @transaction.value())
  end

  # def test_invalid_value
  #   assert_equal(25.2342, @transaction.invalid_value())
  # end

  # def test_round_to_2_dec_places
  #   assert_equal(25.23, @transaction.round_to_2_decimal_places())
  # end

end
