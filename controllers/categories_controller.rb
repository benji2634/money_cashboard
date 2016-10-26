require('pry-byebug')
require_relative('../models/category')

#index
get '/categories' do
  query = params[:search]
  @categories = Category.all(query)
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
get '/categories/:id/edit' do
  @category = Category.find(params[:id])
  erb( :'categories/edit' )
end

# update
put '/categories/:id' do
 @category = Category.update(params)
 redirect to( "/categories/#{params[:id]}" )
end

# delete
delete '/categories/:id' do
  Category.destroy( params[:id] )
  redirect to('/categories')
end