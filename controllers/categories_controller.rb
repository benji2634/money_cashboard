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

# show

# edit

# update

# delete