require('pry-byebug')
require_relative('../models/merchant')

#index
get '/merchants' do
  @merchants = Merchant.all()
  erb(:'merchants/index')
end

# new
get '/merchants/new' do
  erb(:'merchants/new')
end

# create
post '/merchants' do
  @merchants = Merchant.new(params)
  @merchants.save
  erb(:'merchants/create')
end

# show

# edit

# update

# delete