require('pry-byebug')
require_relative('../models/merchant')

#index
get '/merchants' do
  @merchants = Merchant.all()
  erb(:'merchants/index')
end
# new

# create

# show

# edit

# update

# delete