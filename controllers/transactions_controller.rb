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

# create

# show

# edit

# update

# delete