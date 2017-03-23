require('pry')
require_relative('../models/album')
require_relative('../models/artist')

Artist.delete_all()
Album.delete_all()

artist1 = Artist.new({'name' => 'Ryan Adams'})
artist2 = Artist.new({'name' => 'The Shins'})

album1 = Album.new({'title' => 'Gold', 'genre' => 'rock'})
album2 = Album.new({'title' => 'Heartbreaker', 'genre' => 'rock'})

artist1.save()
artist2.save()

# album1.save()
# album2.save()

binding.pry
nil
