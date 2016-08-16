require('pry-byebug')
require_relative('../models/athlete.rb')
require_relative('../models/event.rb')
require_relative('../models/nation.rb')
require_relative('../models/participation.rb')
require_relative('../models/standing.rb')


Athlete.delete_all()
Event.delete_all()
Nation.delete_all()
Participation.delete_all()


nation1 = Nation.new({ 'name' => 'South Africa'})
nation2 = Nation.new({ 'name' => 'Russia'})
nation3 = Nation.new({ 'name' => 'Argentina'})
nation4 = Nation.new({ 'name' => 'Chile'})
nation5 = Nation.new({ 'name' => 'UAE'})

nation1.save
nation2.save
nation3.save
nation4.save
nation5.save

athlete1 = Athlete.new({ 'first_name' => 'Hannah', 'last_name' => 'Stewart', 'nation_id' => nation1.id})
athlete2 = Athlete.new({ 'first_name' => 'Katrina', 'last_name' => 'Coutts', 'nation_id' => nation2.id})
athlete3 = Athlete.new({ 'first_name' => 'David', 'last_name' => 'Morrison', 'nation_id' => nation3.id})
athlete4 = Athlete.new({ 'first_name' => 'John', 'last_name' => 'Easton', 'nation_id' => nation4.id})
athlete5 = Athlete.new({ 'first_name' => 'Michael', 'last_name' => 'Snaddon', 'nation_id' => nation5.id})

athlete1.save
athlete2.save
athlete3.save
athlete4.save
athlete5.save

event1 = Event.new({ 'name' => 'Ping pong', 'gold_id' => athlete5.id, 'silver_id' => athlete3.id, 'bronze_id' => athlete1.id })
event2 = Event.new({ 'name' => 'Javelin', 'gold_id' => athlete4.id, 'silver_id' => athlete2.id, 'bronze_id' => athlete1.id })
event3 = Event.new({ 'name' => 'Synchronised swimming', 'gold_id' => athlete2.id, 'silver_id' => athlete3.id, 'bronze_id' => athlete5.id })
event4 = Event.new({ 'name' => 'Dressage', 'gold_id' => athlete2.id, 'silver_id' => athlete4.id, 'bronze_id' => athlete5.id })
event5 = Event.new({ 'name' => 'Badminton', 'gold_id' => athlete5.id, 'silver_id' => athlete1.id, 'bronze_id' => athlete3.id })

event1.save
event2.save
event3.save
event4.save
event5.save

participation1 = Participation.new({'athlete_id' => athlete1.id, 'event_id' => event1.id})
participation2 = Participation.new({'athlete_id' => athlete2.id, 'event_id' => event2.id})
participation3 = Participation.new({'athlete_id' => athlete3.id, 'event_id' => event3.id})
participation4 = Participation.new({'athlete_id' => athlete4.id, 'event_id' => event4.id})
participation5 = Participation.new({'athlete_id' => athlete5.id, 'event_id' => event5.id})

participation1.save
participation2.save
participation3.save
participation4.save
participation5.save

standing = Standing.new( Athlete.all, Event.all )

athlete5medals = standing.gold_medals_by_athlete( athlete5.id )


# binding.pry
# nil
