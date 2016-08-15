require('pg')
require_relative('../db/sql_runner')

class Nation

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

    def save()
      sql = "INSERT INTO nations (name) VALUES ('#{@name}') RETURNING *"
      nation = SqlRunner.run(sql).first
      @id = nation['id']
    end

    def self.all()
      sql = "SELECT * FROM nations"
      return Nation.map_items(sql)
    end

    def self.find(id)
      sql = "SELECT * FROM nations WHERE id = #{id}"
      return Nation.map_item(sql)
    end

    def self.delete_all()
      sql = "DELETE FROM nations"
      SqlRunner.run(sql)
    end

    def self.map_items(sql)
      nation = SqlRunner.run(sql)
      result = nation.map { |nation| Nation.new( nation ) }
      return result
    end

    def self.map_item(sql)
      result = map_items(sql)
      return result.first
    end

  end


