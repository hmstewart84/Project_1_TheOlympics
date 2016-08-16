require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')
require_relative('controllers/athletes_controller')
require_relative('controllers/events_controller')
require_relative('controllers/nations_controller')
require_relative('controllers/participation_controller')
require_relative('models/standing')
require_relative('models/athlete')
require_relative('models/event')


get '/' do
  @standing = Standing.new( Athlete.all, Event.all )
  erb :home
end
