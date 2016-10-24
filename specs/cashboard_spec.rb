require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../models/cashboard' )

class TestCashboard < MinitTest::Test

  def setup
    transactions = Transactions.all
    @cashboard = Cashboard.new(spend)
  end

  def test_total_spend
    result = @cashboard.total_spend
    assert_equal(264.05, result)
  end

end