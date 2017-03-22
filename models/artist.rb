require( 'pg' )
require_relative('../db/sql_runner')

class Artist

  def initialize(options)
    @name = options["name"]
    @id = options["id"].to_i
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING id"
    result = SqlRunner.run(sql)
    @id = result[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    artist_names = result.map {|artist| Artist.new(artist)}
    return artist_names
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    result = SqlRunner.run(sql)
    return result    
  end

end
