require( 'pg' )
require_relative('../db/sql_runner')

class Album

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO albums (title, genre) VALUES ('#{@title}', '#{@genre}') RETURNING *"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def update
    sql = "UPDATE albums SET (title, genre, artist_id) = ('#{@title}', '#{@genre}', #{@artist_id}) WHERE id = #{@id}"
    result =  SqlRunner.run(sql)
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM artist WHERE id = #{id}"
    result = SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM albums"
    result = SqlRunner.run(sql)
    album_info = result.map {|album| Album.new(album)}
    return album_info 
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    result = SqlRunner.run(sql)
    return result
  end

  def delete
    sql = "DELETE FROM albums WHERE id = #{@id}"
    result = SqlRunner.run(sql)
    return result
  end

end