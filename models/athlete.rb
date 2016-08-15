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
    return @first_name.concat( "#{@last_name}" )
  end  

  def save()
    sql = "INSERT INTO athletes (first_name, last_name) VALUES ('#{@first_name}', '#{@last_name}' ) RETURNING *"
    athlete = SqlRunner.run(sql).first
    @id = athlete['id']
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

  # def gold_medals

  # end
  
  # def silver_medals

  # end

  # def bronze_medals

  # end  

  def nation()
    sql = "SELECT * FROM nations WHERE id = #{@nation_id}"
    return Nation.map_item(sql)
  end
  
  def event()
    sql = "SELECT e.* FROM events e INNER JOIN participations p ON p.event_id = e.id WHERE p.athlete_id = #{@id}"
    return Event.map_item(sql)
  end  

end
