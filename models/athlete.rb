require('pg')
require_relative('../db/sql_runner')

class Athlete

  attr_reader :id, :first_name, :last_name, :nation_id

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @nation_id = options['nation_id'].to_i
  end

  def pretty_name
    return @first_name.concat( " #{@last_name}" )
  end  

  def save()
    sql = "INSERT INTO athletes (first_name, last_name, nation_id) VALUES ('#{@first_name}', '#{@last_name}', '#{@nation_id}' ) RETURNING *"
    athlete = SqlRunner.run(sql).first
    @id = athlete['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM athletes"
    return Athlete.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM athletes WHERE id = #{id}"
    return Athlete.map_item(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM athletes"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    athlete = SqlRunner.run(sql)
    result = athlete.map { |athlete| Athlete.new( athlete ) }
    return result
  end

  def self.map_item(sql)
    result = Athlete.map_items(sql)
    return result.first
  end

  def self.update( options )
    sql = "UPDATE athletes set
          first_name='#{options['first_name'] }'
          last_name= '#{options['last_name'] }'
          WHERE id=#{options['id']}"
    SqlRunner.run( sql )
  end 

  def nation()
    sql = "SELECT * FROM nations WHERE id = #{@nation_id}"
    return Nation.map_item(sql)
  end
  
  def events()
    sql = "SELECT e.* FROM events e INNER JOIN participations p ON p.event_id = e.id WHERE p.athlete_id = #{@id}"
    return Event.map_items(sql)
  end 

  def gold_medals()
    gold_medals = []
    @events.each do |event|
      if event.gold_id.to_i == @id
        gold_medals << event
      end
    end
    return gold_medals
  end

    
  def silver_medals
    silver_medals = []
    @events.each do |event|
      if event.silver_id.to_i == @id
        silver_medals << event
      end
    end
    return silver_medals
  end  

    def bronze_medals
      bronze_medals = []
      events.each do |event|
    if event.bronze_id.to_i == @id
      bronze_medals << event
      end
    end  
      return bronze_medals
    end 

end

def gold_medal_points()
    gold_medal_points = (gold_medals.count * 5) 
    return gold_medal_points
end

def silver_medal_points()
    silver_medal_points = (silver_medals.count * 3) 
    return silver_medal_points
end

def bronze_medal_points()
    bronze_medal_points = (bronze_medals.count * 1) 
    return bronze_medal_points
end

def gold_medals_count()
    gold_medals = 0
    events.each do |event|
      if event.gold_id.to_i == @id
        gold_medals += 1
      end
    end
    return gold_medals
  end  
  