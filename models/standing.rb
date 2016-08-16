require('pg')
require_relative('athlete')
require_relative('event')
require('pry-byebug')

class Standing

  attr_accessor :athletes, :events

  def initialize(athletes, events)
    @athletes = athletes
    @events = events
  end

  # def get_nation_medals(nation)
  #   get athletes in nation
  #   get medals for each athlete and add to hoard

  # end

  def get_medals( athlete_id )
    medals = {
      gold: gold_medals_by_athlete(athlete_id),
      silver: silver_medals_by_athlete(athlete_id),
      bronze: bronze_medals_by_athlete(athlete_id)
    }
  end

  def gold_medals_by_athlete( athlete_id )
    @events.select do | event | 
      event.gold_id == athlete_id 
    end
  end

  def silver_medals_by_athlete( athlete_id )
    @events.select do | event | 
      event.silver_id == athlete_id 
    end
  end

  def bronze_medals_by_athlete( athlete_id )
    @events.select do | event | 
      event.bronze_id == athlete_id 
    end
  end



  # def total_points()
  #   total = 0
  #   @athletes.each do |athlete|
  #     total = total + athlete.gold_medal_points + athlete.silver_medal_points + athlete.bronze_medal_points
  #   end
  #   return total
  # end  

end  