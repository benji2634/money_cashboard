require('pry-byebug')
require_relative('../models/transaction')
require_relative('../models/category')
require_relative('../models/merchant')

#index
get '/transactions' do
  @transactions = Transaction.all()
  erb(:'transactions/index')
end

# new
get '/transactions/new' do
  @categories = Category.all()
  @merchants = Merchant.all()
  erb(:'transactions/new')
end

# create

# show

# edit

# update

# delete