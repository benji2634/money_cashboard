require('pry-byebug')
require_relative('../models/category')

#index
get '/categories' do
  @categories = Category.all()
  erb(:'categories/index')
end

# new
get '/categories/new' do
  erb(:'categories/new')
end

# create
post '/categories' do
  @categories = Category.new(params)
  @categories.save
  erb(:'categories/create')
end

# show
get '/categories/:id' do
  @category = Category.find(params[:id])

  transactions = @category.transactions
  @cashboard = Cashboard.new(transactions)

  erb(:'categories/show')
end

# edit

# update

# delete