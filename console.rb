require('pry-byebug')

require_relative('models/merchant')
require_relative('models/category')
require_relative('models/transaction')
require_relative('models/cashboard')
require_relative('db/seeds')

@all_transactions = Transaction.all
cashboard_all = Cashboard.new(@all_transactions)

category1 = Category.all[0]
@transactions1 = category1.transactions
cashboard1 = Cashboard.new(@transactions1)

category2 = Category.all[1]
@transactions2 = category2.transactions
cashboard2 = Cashboard.new(@transactions2)

category3 = Category.all[2]
@transactions3 = category3.transactions
cashboard3 = Cashboard.new(@transactions3)

binding.pry
nil