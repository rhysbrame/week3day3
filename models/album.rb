require( 'pg' )
require_relative('../db/sql_runner')

class Album

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
  end

  def save
    sql = "INSERT INTO albums (title, genre) VALUES ('#{@title}', '#{@genre}') RETURNING *"
    result = SqlRunner.run(sql)
    return result
  end








end