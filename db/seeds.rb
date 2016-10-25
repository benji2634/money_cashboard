require('pry-byebug')
require_relative('../models/merchant')
require_relative('../models/category')
require_relative('../models/transaction')
require_relative('../models/cashboard')

Transaction.delete_all
Category.delete_all
Merchant.delete_all

merchant1 = Merchant.new({'name' => 'Tesco', 'location' => 'Bathgate', 'website_url' => 'http://www.tesco.com'})
merchant2 = Merchant.new({'name' => 'Morrisons', 'location' => 'Bathgate', 'website_url' => 'http://www.morrisons.com'})
merchant3 = Merchant.new({'name' => 'Asda', 'location' => 'Armadale', 'website_url' => 'http://www.asda.com'})
merchant4 = Merchant.new({'name' => 'ScotRail', 'location' => 'Bathgate', 'website_url' => 'http://www.scotrail.co.uk'})
merchant5 = Merchant.new({'name' => 'The Chanter', 'location' => 'Edinburgh', 'website_url' => 'http://www.thechanterpub.co.uk'})
merchant6 = Merchant.new({'name' => 'Topman', 'location' => 'Livingston', 'webstite_url' => 'http://www.topman.com'})
merchant7 = Merchant.new({'name' => 'British Gas', 'location' => 'Uddingston', 'webstite_url' => 'http://www.britishgas.co.uk'})

merchant1.save
merchant2.save
merchant3.save
merchant4.save
merchant5.save
merchant6.save
merchant7.save

category1 = Category.new({'type' => 'Food'})
category2 = Category.new({'type' => 'Travel'})
category3 = Category.new({'type' => 'Social'})
category4 = Category.new({'type' => 'Clothes'})
category5 = Category.new({'type' => 'Utility'})

category1.save
category2.save
category3.save
category4.save
category5.save

transaction1 = Transaction.new({'merchant_id' => merchant1.id, 'category_id' => category1.id, 'value' => '25.33'})
transaction2 = Transaction.new({'merchant_id' => merchant2.id, 'category_id' => category2.id, 'value' => '46.67'})
transaction3 = Transaction.new({'merchant_id' => merchant4.id, 'category_id' => category2.id, 'value' => '9.10'})
transaction4 = Transaction.new({'merchant_id' => merchant5.id, 'category_id' => category3.id, 'value' => '2.72'})
transaction5 = Transaction.new({'merchant_id' => merchant6.id, 'category_id' => category4.id, 'value' => '50.98'})
transaction6 = Transaction.new({'merchant_id' => merchant7.id, 'category_id' => category5.id, 'value' => '92.43'})

transaction1.save
transaction2.save
transaction3.save
transaction4.save
transaction5.save
transaction6.save



