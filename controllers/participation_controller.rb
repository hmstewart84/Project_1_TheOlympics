require_relative('../models/participation')

#index
get '/participations' do
  @participations = Participation.all()
  erb(:'participations/index')
end

#new
get '/participations/new' do
  erb(:'participations/new')
end

#show
get '/participations/:id' do
  @participation = Participation.find(params['id'])
  erb(:'participations/show')
end

#edit
get '/participations/:id/edit' do
  @participation = Participation.new(params[:id])
  erb(:'participations/edit')
end

#create
post '/participations' do
  @participation = Participation.new(params)
  @participation.save
  redirect to('/participations')
end

#update
post '/participations/:id' do
end

#delete
delete '/participations' do
end
