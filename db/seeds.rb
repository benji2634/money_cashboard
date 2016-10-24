require('pry-byebug')
require_relative('../models/merchant')
require_relative('../models/category')
require_relative('../models/transaction')
require_relative('../models/cashboard')

Transaction.delete_all
Category.delete_all
Merchant.delete_all

merchant1 = Merchant.new({'name' => 'Tesco', 'location' => 'Bathgate', 'website_url' => 'www.tesco.com'})
merchant2 = Merchant.new({'name' => 'Morrisons', 'location' => 'Bathgate', 'website_url' => 'www.morrisons.com'})
merchant3 = Merchant.new({'name' => 'Asda', 'location' => 'Armadale', 'website_url' => 'www.asda.com'})
merchant4 = Merchant.new({'name' => 'ScotRail', 'location' => 'Bathgate', 'website_url' => 'www.scotrail.co.uk'})
merchant5 = Merchant.new({'name' => 'The Chanter', 'location' => 'Edinburgh', 'website_url' => 'www.thechanterpub.co.uk'})

merchant1.save
merchant2.save
merchant3.save
merchant4.save
merchant5.save

category1 = Category.new({'type' => 'food', 'description' => 'weekly'})
category2 = Category.new({'type' => 'food', 'description' => 'incidentals'})
category3 = Category.new({'type' => 'fuel', 'description' => 'tank refill'})
category4 = Category.new({'type' => 'fuel', 'description' => 'tank top-up'})
category5 = Category.new({'type' => 'travel', 'description' => 'rail season ticket'})
category6 = Category.new({'type' => 'travel', 'description' => 'rail individual ticket'})
category7 = Category.new({'type' => 'social', 'description' => 'drinks'})
category8 = Category.new({'type' => 'social', 'description' => 'meal'})

category1.save
category2.save
category3.save
category4.save
category5.save
category6.save
category7.save
category8.save

transaction1 = Transaction.new({'merchant_id' => merchant1.id, 'category_id' => category1.id, 'value' => '25.33'})
transaction2 = Transaction.new({'merchant_id' => merchant2.id, 'category_id' => category2.id, 'value' => '2.56'})
transaction3 = Transaction.new({'merchant_id' => merchant3.id, 'category_id' => category2.id, 'value' => '9.34'})
transaction4 = Transaction.new({'merchant_id' => merchant4.id, 'category_id' => category6.id, 'value' => '9.10'})
transaction5 = Transaction.new({'merchant_id' => merchant4.id, 'category_id' => category5.id, 'value' => '149.00'})
transaction6 = Transaction.new({'merchant_id' => merchant5.id, 'category_id' => category7.id, 'value' => '2.72'})
transaction7 = Transaction.new({'merchant_id' => merchant5.id, 'category_id' => category8.id, 'value' => '5.99'})
transaction8 = Transaction.new({'merchant_id' => merchant2.id, 'category_id' => category3.id, 'value' => '50.01'})
transaction9 = Transaction.new({'merchant_id' => merchant1.id, 'category_id' => category4.id, 'value' => '10.00'})

transaction1.save
transaction2.save
transaction3.save
transaction4.save
transaction5.save
transaction6.save
transaction7.save
transaction8.save
transaction9.save

@all_transactions = Transaction.all
cashboard = Cashboard.new(@all_transactions)
puts cashboard.totaller

@transactions1 = category1.transactions
cashboard1 = Cashboard.new(@transactions1)
puts cashboard1.totaller

@transactions2 = category2.transactions
cashboard2 = Cashboard.new(@transactions2)
puts cashboard2.totaller

@transactions3 = category3.transactions
cashboard3 = Cashboard.new(@transactions3)
puts cashboard3.totaller

binding.pry
nil


