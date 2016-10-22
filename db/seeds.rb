require('pry-byebug')
require_relative('..models/merchant')
require_relative('..models/category')
require_relative('..models/transaction')

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

category1.save = Category.new({'type' => 'food', 'description' => 'weekly'})
category2.save = Category.new({'type' => 'food', 'description' => 'incidentals'})
category3.save = Category.new({'type' => 'fuel', 'description' => 'tank refill'})
category4.save = Category.new({'type' => 'fuel', 'description' => 'tank top-up'})
category5.save = Category.new({'type' => 'travel', 'description' => 'rail season ticket'})
category6.save = Category.new({'type' => 'travel', 'description' => 'rail individual ticket'})
category7.save = Category.new({'type' => 'social', 'description' => 'drinks'})
category8.save = Category.new({'type' => 'social', 'description' => 'meal'})

category1.save
category2.save
category3.save
category4.save
category5.save
category6.save
category7.save
category8.save

transaction1.save = Transaction.new({'merchant_id' => merchant1.id, 'category_id' => category1.id})
transaction2.save = Transaction.new({'merchant_id' => merchant2.id, 'category_id' => category2.id})
transaction3.save = Transaction.new({'merchant_id' => merchant3.id, 'category_id' => category2.id})
transaction4.save = Transaction.new({'merchant_id' => merchant3.id, 'category_id' => category3.id})
transaction5.save = Transaction.new({'merchant_id' => merchant4.id, 'category_id' => category6.id})
transaction6.save = Transaction.new({'merchant_id' => merchant4.id, 'category_id' => category5.id})
transaction7.save = Transaction.new({'merchant_id' => merchant5.id, 'category_id' => category7.id})
transaction8.save = Transaction.new({'merchant_id' => merchant5.id, 'category_id' => category8.id})
transaction9.save = Transaction.new({'merchant_id' => merchant2.id, 'category_id' => category3.id})
transaction10.save = Transaction.new({'merchant_id' => merchant1.id, 'category_id' => category4.id})

transaction1.save
transaction2.save
transaction3.save
transaction4.save
transaction5.save
transaction6.save
transaction7.save
transaction8.save
transaction9.save
transaction10.save

binding.pry
nil


