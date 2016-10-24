require('pry-byebug')
require_relative('../models/category')

#index
get '/categories' do
  @categories = Category.all()
  erb(:'categories/index')
end
# new

# create

# show

# edit

# update

# delete