require_relative('../models/athlete')

#index
get '/athletes' do
  @athletes = Athlete.all
  erb(:'athletes/index')
end

#new
get '/athletes/new' do
  erb(:'athletes/new')
end

#show
get '/athletes/:id' do
  @athlete = Athlete.find(params['id'])
  erb(:'athlete/show')
end

#edit
get '/athlete/:id/edit' do
end

#create
post '/athlete' do
  @athlete = Athlete.new(params)
  @athlete.save
  redirect to( "athlete" )
end

#update
post '/athlete/:id' do
end

#delete
delete '/athlete' do
end