require( 'pg' )
require_relative('../db/sql_runner')

class Album

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "INSERT INTO albums (title, genre) VALUES ('#{@title}', '#{@genre}') RETURNING *"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end








end