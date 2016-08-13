require('pg')
require_relative('../db/sql_runner')
 

class Event

  attr_reader :id, :name, :sport, :gold_id, :silver_id, :bronze_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @sport = options['sport']
    @gold_id = options['gold_id'].to_i
    @silver_id = options['silver_id'].to_i
    @bronze_id = options['bronze_id'].to_i
  end

  def save()
    sql = "INSERT INTO events (name, sport) VALUES ('#{@name}', '#{@sport}' ) RETURNING *"
    event = SqlRunner.run(sql).first
    @id = event['id']
  end

  def self.all()
    sql = "SELECT * FROM events"
    return Event.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM events WHERE id = #{id}"
    return Event.map_item(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM books"
    SqlRunner.run(sql)
  end


  def self.map_items(sql)
    book = SqlRunner.run(sql)
    result = book.map { |product| Book.new( product ) }
    return result
  end

  def self.map_item(sql)
    result = Book.map_items(sql)
    return result.first
  end

end
