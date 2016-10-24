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

# edit

# update

# delete