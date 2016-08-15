require('pg')
require_relative('../db/sql_runner')


class Participation

  attr_reader :id, :event_id, :athlete_id

  def initialize( options )
    @id = options['id'].to_i
    @event_id = options['event_id'].to_i
    @athlete_id = options['athlete_id'].to_i
  end

  def save()
    sql = "INSERT INTO participations (event_id, athlete_id) VALUES (#{@event_id}, #{@athlete_id}) RETURNING *"
    participation = SqlRunner.run(sql).first
    @id = participation['id']
  end

  def athlete()
    sql = "SELECT * FROM athlete WHERE id = #{@athlete_id}"
    return Athlete.map_item(sql)
  end

  def event()
    sql = "SELECT * FROM events WHERE id = #{@event_id}"
    return Event.map_item(sql)
  end

  def nation()
    sql = "SELECT * FROM nations WHERE id = #{@nation_id}"
    return Nation.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM participations"
    return Participation.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM participations WHERE id = #{id}"
    return Participation.map_item(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM participations"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    participation = SqlRunner.run(sql)
    result = participation.map { |thing| Participation.new( thing ) }
    return result
  end

  def self.map_item(sql)
    result = Participation.map_items(sql)
    return result.first
  end

end
