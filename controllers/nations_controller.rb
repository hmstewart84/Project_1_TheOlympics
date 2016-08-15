require_relative('../models/nation')

#index
get '/nations' do
  @nations = Nation.all()
  erb(:'nations/index')
end

#new
get '/nations/new' do
  erb(:'nations/new')
end

#show
get '/nations/:id' do
  @nation = Nation.find(params['id'])
  erb(:'nations/show')
end

#edit
get '/nations/:id/edit' do
end

#create
post '/nations' do
  @nation = Nation.new(params)
  @nation.save
  redirect to('/nations')
end

#update
post '/nations/:id' do
end

#delete
delete '/nations' do
end
