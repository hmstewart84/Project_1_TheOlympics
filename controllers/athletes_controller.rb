require_relative('../models/athlete')
require('pry-byebug')

#index
get '/athletes' do
  @athletes = Athlete.all
  erb(:'athletes/index')
end

#new
get '/athletes/new' do
  @nations = Nation.all
  @events = Event.all
  erb(:'athletes/new')
end

#show
get '/athletes/:id' do
  @athlete = Athlete.find(params['id'])
  @events = @athlete.events
  erb(:'athletes/show')
end

#edit
get '/athletes/:id/edit' do
  @athlete = Athlete.find(params[:id])
  erb(:'athletes/edit')
end

#create
post '/athletes' do
  @athlete = Athlete.new(params)
  @athlete.save
  redirect to( "athletes" )
end

#update
post '/athletes/:id' do
  @athlete = Athlete.update( params )
  redirect to( "/athletes/#{params[:id]}" )
end

#delete
delete '/athletes/:id' do
  Athlete.destroy( params[:id] )
  redirect to('/athletes')
end