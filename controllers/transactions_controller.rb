require('pry-byebug')
require_relative('../models/transaction')
require_relative('../models/category')
require_relative('../models/merchant')
require_relative('../models/cashboard')

#index
get '/transactions' do
  query = params[:search]
  addon = params[:addon]
  @transactions = Transaction.all(query, addon)
  @cashboard_all = Cashboard.new(@transactions)

  erb(:'transactions/index')
end

# new
get '/transactions/new' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @transactions = Transaction.all()
  erb(:'transactions/new')
end

# create
post '/transactions' do
  @transactions = Transaction.new(params)
  @transactions.save
  erb(:'transactions/create')
end

# show
get '/transactions/:id' do
  @transactions = Transaction.find(params[:id])
  erb(:'transactions/show')
end

# edit
get '/transactions/:id/edit' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @transaction = Transaction.find(params[:id])
  erb( :'transactions/edit' )
end

# update
put '/transactions/:id' do
 @transaction = Transaction.update(params)
 redirect to( "/transactions/#{params[:id]}" )
end

# delete
delete '/transactions/:id' do
  Transaction.destroy( params[:id] )
  redirect to('/transactions')
end